require_relative './controllers/session_controller'
require_relative './controllers/team_controller'
require_relative './controllers/notification_controller'
require_relative './controllers/leave_controller'
require_relative './views/common'
require_relative './views/root_view'
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
        screen_leave
      when 3
        screen_notif
      when 4
        p 'Logout'
        $user = nil
        screen1
      when 5
        exit!
      when 6
        # screen_csv
      else
        p '=====>Notice! :Choose number 1-> 6'
      end
    end
  else # team manager or team lead and member
    loop do
      x = screen1_for_member_lead
      case x
      when 1
        screen_team
      when 2
        screen_leave
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
      TeamController.add_member($user)
      system('clear')
      p 'Add member success'
    when 3
      system('clear')
      result = Team.get_all_team
      result.each do |x|
        p "#{x['id']}. #{x['name']}"
      end
      loop do
        p 'Enter id of a team in above list:'
        id = gets.chomp.to_i
        break if id > 0 && id <= result.size
        p 'wrong id'
      end
      TeamController.list_members(id)
    when 5
      p 'Logout'
      $user = nil
      screen1
    when 6
      exit!
    else
      p '=====>Notice! :Choose number 1-> 6'
      break if x == 4
    end
  end
end

def screen_team_of_lead
  system('clear')
  loop do
    x = manage_team_of_lead
    case x
    when 1
      TeamController.add_member($user)
      system('clear')
      p 'Add member success'
    when 2
      TeamController.members($user)
    when 4
      screen1 $user.role
    when 5
      p 'Logout'
      $user = nil
      screen1
    when 6
      exit!
    else
      p '=====>Notice! :Choose number 1-> 6'
      break if x == 4
    end
  end
end

def screen_notif
  system('clear')
  loop do
    p '========== Notification Management ==========='
    p '1. Send a notification(only team lead)' if $user.role == 'team_lead'
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
      NotificationController.send($user)
      system('clear')
      p 'Send notification success!'
    when 2
      NotificationController.read($user)
    when 3
      NotificationController.delete($user)
      system('clear')
      p 'Delete notification success!'
    when 4
      NotificationController.read($user)
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

def screen_leave
  system('clear')
  loop do
    p '========== Leave Management ==========='
    p '1. Send a leave request'
    p '2. Show list leaves request need approve(only team lead)' if $user.role == 'team_lead'
    p '3. Approve or reject leave request(only team lead)' if $user.role == 'team_lead'
    p '4. Update a leave request'
    p '5. Show list of leaves of employees.'
    p '6. Return: Go to Level 1.'
    p '7. Logout: Go to Level 0.'
    p '8. Exit: Shutdown program.'
    p 'Choose number:'
    x = gets.chomp.to_i
    case x
    when 1
      system('clear')
      if LeaveController.request($user)
        p 'Send leave request success'
      else
        p 'Error with total day off'
      end
    when 2
      LeaveController.new.show($user, 'sending')
      p '===================================='
    when 3
      p LeaveController.new.approve($user)
    when 4
      p LeaveController.new.update($user)
    when 5
      LeaveController.new.list_of_leaves($user)
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
# Screen level 0
system('clear')
screen0
