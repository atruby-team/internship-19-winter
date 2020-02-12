require_relative '../models/employee.rb'
require_relative '../models/team.rb'
require 'pry'

class TeamController  
  def add_member(user)
    system('clear')
    p '=========Add Team Member========='
    p 'List member no position:'
    team = user.team_id
    old_team = 0
    id_member = 0
    member = Employee.new.get_all
    arr_id = []
    member.each do |x|
      if x['team_id'] != team
        p "#{x['id']}. #{x['name']}"
        arr_id .push(x['id'])
      end
    end
    loop do
      p 'Choose id member:'
      id_member = gets.chomp.to_i
      if arr_id.include? id_member
        old_team = member.find {|item| item['id'] == id_member }['team_id']
        break
      end
    end
    Employee.new.update_team(id_member, user.team_id)
    Team.new.update_team_member(old_team, user.team_id)
  end

  def self.members(user)
    system('clear')
    result = Employee.new.get_member_team(user.team_id)
    p '=========== List member ============'
    result.each do |x|
      p "#{x['id']}. #{x['name']}"
    end
  end

  def self.list_members team_id
    system('clear')
    result = Employee.new.get_member_team(team_id)
    p '=========== List member ============'
    result.each do |x|
      p "#{x['id']}. #{x['name']}"
    end
  end
end
