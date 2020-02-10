require 'bcrypt'
require_relative '../models/employee.rb'
class SessionController
  def login
    system('clear')
    p '==========Login==========='
    p 'Enter username:'
    username = gets.chomp
    p 'Enter password:'
    password = gets.chomp
    result = Employee.new.check_user(username)
    unless result.size < 0
      result.each do |x|
        next unless BCrypt::Password.new(x.values_at('password').first) == password
        user_login = Employee.new
        user_login.id = x['id']
        user_login.team_id = x['team_id']
        user_login.username = x['username']
        user_login.leave_balance = x['leave_balance']
        user_login.name = x['name']
        user_login.role = x['role']
        return user_login
      end
    end
    false
  end

  def register
    name = ''
    username = ''
    loop do
      system('clear')
      p '==========Register==========='
      p 'Enter name:'
      name = gets.chomp
      p 'Enter username:'
      username = gets.chomp
      result = Employee.new.check_user(username)
      break if result.empty?
      p 'username was exist. Please reinput!'
    end
    p 'Enter password:'
    password = BCrypt::Password.create(gets.chomp)
    p 'Choose role:(1 -> root, 2-> team_lead, 3-> team_member)'
    number = gets.chomp.to_i
    role = number
    p 'Choose role:(1 -> ruby, 2-> fe, 3-> ios)'
    number = gets.chomp.to_i
    team_id = number
    result = Employee.new.add_employee(name, team_id, username, password, role)
    system('clear')
    p result ? 'Register success' : 'Error'
  end

  def forgot_password
    system('clear')
    p '========== Forgot Password ==========='
    p 'Enter username:'
    username = gets.chomp
    result = Employee.new.check_user(username)
    if !result.empty?
      p 'Enter new password:'
      password = BCrypt::Password.create(gets.chomp)
      Employee.new.update_password(username, password)
      p 'Update success'
    else
      p 'Invalid username'
    end
  end
end
