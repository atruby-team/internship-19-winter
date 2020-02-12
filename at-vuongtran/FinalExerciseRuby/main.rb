require_relative './controllers/session_controller'
require_relative './controllers/team_controller'
require_relative './controllers/notification_controller'
require_relative './controllers/leave_controller'
require_relative './views/common'
require_relative './views/root_view'
require_relative './views/lead_view'
require_relative './views/member_view'
require 'pry'

$user = nil

def screen0
  loop do
    main_menu
    x = gets.chomp.to_i
    case x
    when 1
      $user = SessionController.new.login
      if $user
        system('clear')
        p "WELCOME #{$user.username}"
        screen1 $user.role
      else
        p 'Invalid username or password!!!'
      end
    when 2
      SessionController.new.register
    when 3
      SessionController.new.forgot_password
    when 4
      exit!
    else
      system('clear')
      p '=====>Notice! :Choose number 1-> 4'
    end
  end
end

def screen1 role
  if role == 1 # root
    loop do
      x = root_menu
      case x
      when 1
        screen_team_of_root
      when 2
        screen_leave_of_root_and_member
      when 3
        screen_notif
      when 4
        p 'Logout'
        $user = nil
        screen1 $user.role
      when 5
        exit!
      when 6
        # screen_csv
      else
        p '=====>Notice! :Choose number 1-> 6'
      end
    end
  elsif role == 2 # team manager or team lead 
    loop do
      x = screen1_for_member_lead
      case x
      when 1
        screen_team_of_lead
      when 2
        screen_leave_of_lead
      when 3
        screen_notif
      when 4
        p 'Logout'
        $user = nil
        screen1
      when 5
        exit!
      else
        p '=====>Notice! :Choose number 1-> 5'
      end
    end
  else
    loop do
      x = screen1_for_member_lead
      case x
      when 1
        screen_team_of_member
      when 2
        screen_leave_of_root_and_member
      when 3
        screen_notif
      when 4
        p 'Logout'
        $user = nil
        screen1
      when 5
        exit!
      else
        p '=====>Notice! :Choose number 1-> 5'
      end
    end
  end
end
# ==============================================
# team manager of screen 1
def screen_team_of_root
  system('clear')
  loop do
    x = manage_team_of_root
    case x
    when 1
      TeamController.new
      system('clear')
      p 'Create team success!'
    when 2
      system('clear')
      result = Team.new.get_all_team
      result.each do |x|
        p "#{x['id']}. #{x['name']}"
      end
      id = nil
      loop do
        p 'Enter id of a team in above list:'
        id = gets.chomp.to_i
        break if id > 0 && id <= result.size
        p 'wrong id'
      end
      TeamController.list_members(id)
    when 4
      p 'Logout'
      $user = nil
      screen1
    when 5
      exit!
    else
      break if x == 3
      p '=====>Notice! :Choose number 1-> 6'
    end
  end
end

def screen_team_of_lead
  system('clear')
  loop do
    x = manage_team_of_lead
    case x
    when 1
      system('clear')
      TeamController.new.add_member($user)
      p 'Add member success'
    when 2
      TeamController.members($user)
    when 4
      p 'Logout'
      $user = nil
      screen1
    when 5
      exit!
    else
      break if x == 3
      p '=====>Notice! :Choose number 1-> 5'
    end
  end
end

def screen_team_of_member
  system('clear')
  loop do
    x = manage_team_of_member
    case x
    when 1
      TeamController.members($user)
    when 3
      p 'Logout'
      $user = nil
      screen1
    when 4
      exit!
    else
      p '=====>Notice! :Choose number 1-> 4'
      break if x == 2
    end
  end
end
# ==============================================
# notification manager of screen 1
def screen_notif
  system('clear')
  loop do
    p '========== Notification Management ==========='
    p '1. Send a notification(only team lead)' if $user.role == 2
    p '2. Read a notification'
    p '3. Delete a notification'
    p '4. Show list of notifications.'
    p '5. Return: Go to Level 1'
    p '6. Logout: Go to Level 0'
    p '7. Exit: Shutdown program'
    p 'Choose number:'
    x = gets.chomp.to_i
    case x
    when 1
      NotificationController.new.send($user)
      system('clear')
      p 'Send notification success!'
    when 2
      puts `clear`
      puts 'Enter id'
      x = gets.chomp.to_i
      NotificationController.new.read(x)
    when 3
      puts `clear`
      arr = NotificationController.new.notifications($user.team_id)
      x = nil
      if arr.size.zero?
        puts "Empty list to can delete"
        next
      end
      loop do
        puts 'Enter id'
        x = gets.chomp.to_i
        break if x > 0 && x <= arr.size
      end
      NotificationController.new.delete(x)
      system('clear')
      p 'Delete notification success!'
    when 4
      NotificationController.new.notifications($user.team_id)
    when 6
      p 'Logout'
      $user = nil
      screen1
    when 7
      exit!
    else
      p '=====>Notice! :Choose number 1-> 6'
      break if x == 5
    end
  end
end

def screen_leave_of_root_and_member
  system('clear')
  loop do
    x = screen_menu_leave_for_root_and_member
    id = nil
    case x
    when 1
      system('clear')
      if LeaveController.new.create($user)
        p 'create leave request success'
      else
        p 'Error with total day off'
      end
    when 2
      LeaveController.new.show_your_leave $user
    when 3
      p LeaveController.new.update($user)
    when 4
      system('clear')
      a = LeaveController.new
      arr = a.show($user, 'non-sending')
      id = 0
      loop do
        p "enter id: "
        id = gets.chomp.to_i
        break if arr.find { |item| item['id'] == id }
      end
      if LeaveController.new.request(id)
        p 'Send leave request success'
      else 
        p 'Sending failed!'
      end
    when 5
      LeaveController.new.show_your_team_leave($user.team_id)
      p '===================================='
    when 7
      p 'Logout'
      $user = nil
      screen1
    when 8
      exit!
    else
      p '=====>Notice! :Choose number 1-> 8'
      break if x == 6
    end
  end
end

def screen_leave_of_lead
  system('clear')
  loop do
    p '========== Leave Management ==========='
    p '1. Create a leave request'
    p '2. Show your leave request'
    p '3. Update your leave request'
    p '4. Send your leave request'
    p '5. Show list leaves request need approve(only team lead)'
    p '6. Approve or reject leave request(only team lead)'
    p '7. Show list of leaves of employees.'
    p '8. Return: Go to Level 1.'
    p '9. Logout: Go to Level 0.'
    p '10. Exit: Shutdown program.'
    p 'Choose number:'
    x = gets.chomp.to_i
    case x
    when 1
      system('clear')
      if LeaveController.new.create($user)
        p 'create leave request success'
      else
        p 'Error with total day off'
      end
    when 2
      system('clear')
      LeaveController.new.show_your_leave $user
    when 3
      system('clear')
      p LeaveController.new.update($user)
    when 4
      system('clear')
      a = LeaveController.new
      arr = a.show($user, 'non-sending')
      id = 0
      loop do
        p "enter id: "
        id = gets.chomp.to_i
        break if arr.find { |item| item['id'] == id }
      end
      LeaveController.new.request(id)
      p 'Send leave request success'
    when 5
      system('clear')
      LeaveController.new.show_your_team_leave_need_approve $user.team_id
    when 6
      system('clear')
      LeaveController.new.approve $user
    when 7
      LeaveController.new.list_of_leaves($user)
      p '===================================='
    when 9
      p 'Logout'
      $user = nil
      screen0
    when 10
      exit!
    else
      break if x == 8
      p '=====>Notice! :Choose number 1-> 10'
    end
  end
end

# Screen level 0
system('clear')
screen0
