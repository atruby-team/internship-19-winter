require_relative '../models/leave'
require_relative '../models/employee'
require 'pry'
class LeaveController
  def request id
    system('clear')
    Leave.new.send_request id
  end

  def create(user)
    system('clear')
    p '========= Create Leave Request ========='
    balance = user.leave_balance
    p 'Enter reason:'
    reason = gets.chomp
    p 'Enter total date of:'
    total = gets.chomp.to_i
    return false if balance < total
    Leave.new.create_request(reason, total, user.id)
    true
  end

  def show_your_leave user
    arr = Leave.new.get_your_leave user.id
    system('clear')
    arr.each_with_index do |item, index|
      p "#{index}, #{item['id']}, #{item['reason']}, #{item['total_day_off']}, #{item['status']}, #{item['publish_date']}"
    end
  end

  def show_your_team_leave id
    arr = Leave.new.get_your_team_leave(id, 'approve')
    system('clear')
    arr.each_with_index do |item, index|
      p "#{index}, #{item['id']}, #{item['name']}, #{item['reason']}, #{item['total_day_off']}, #{item['publish_date']}"
    end
  end

  def show_your_team_leave_need_approve team_id
    arr = Leave.new.get_your_team_leave(team_id, 'sending')
    system('clear')
    arr.each_with_index do |item, index|
      p "#{index}, #{item['id']}, #{item['name']}, #{item['reason']}, #{item['total_day_off']}, #{item['publish_date']}"
    end
  end

  def show(user, status)
    @arr_id = []
    system('clear')
    p '============== List Leave Request =================='
    result = if user.role == '1'
               Leave.new.get_list_lead(user.team_id, status)
             else
               Leave.new.get_list_employee(user.id, status)
             end
    result.each do |x|
      p "#{x['id']}. #{x['name']} : #{x['reason']}"
      @arr_id.push(x['leave_id'])
    end
  end

  def approve(user)
    id_request = 0
    a = show(user, 'sending')
    return nil if a.size.zero?
    loop do
      p 'Choose request:'
      id_request = gets.chomp.to_i
      break if a.find { |item| item['id'] == id_request}
    end
    request = Leave.new.get_item(id_request).first
    p 'Choose 1 -> approve or 2 -> reject'
    i = gets.chomp.to_i
    case i
    when 1
      Leave.new.reponse_approve(id_request)
      Employee.new.update_balance(user.id, request['total_day_off'])
      'Leader approve request'
    when 2
      Leave.new.reponse_reject(id_request)
      'Leader reject request'
    end
  end

  def update(user)
    id_request = 0
    return 'No request' if show(user, 'rejected').empty?
    loop do
      p 'Choose request:'
      id_request = gets.chomp.to_i
      break if @arr_id.include? id_request
    end
    p '============ Update Request ==========='
    p 'Enter reason:'
    reason = gets.chomp
    Leave.new.update_request(reason, id_request)
    'Update success'
  end

  def delete(user)
    id_request = 0
    return 'No request' if show(user, 'rejected').empty?
    loop do
      p 'Choose request:'
      id_request = gets.chomp.to_i
      break if @arr_id.include? id_request
    end
    Leave.new.delete_request(id_request)
    'Delete success'
  end

  def list_of_leaves(user)
    return 'No request' if show(user, 'approved').empty?
    show(user, 'approved')
  end
end
