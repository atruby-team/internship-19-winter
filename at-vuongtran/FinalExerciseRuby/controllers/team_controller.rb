require_relative '../models/employee.rb'
require_relative '../models/team.rb'
require 'pry'

class TeamController
  def initialize
    p '=======Create team========'
    p 'Enter name:'
    team_name = gets.chomp
    # create user lead by root. after when team have many member root will set a member to lead
    Team.new.create_team(team_name)
  end
  
  def self.add_member(user)
    id_member = 0
    arr_id = []
    member = Employee.new.get_employee('team_member')
    loop do
      system('clear')
      p '=========Add Team Member========='
      p 'List member no position:'
      member.each do |x|
        p "#{x['id']}. #{x['name']}"
        arr_id .push(x['id'])
      end
      p 'Choose member:'
      id_member = gets.chomp.to_i
      break if arr_id.include? id_member
    end
    Employee.new.update_team(id_member, user.team_id)
    Team.new.update_member(user.team_id)
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
