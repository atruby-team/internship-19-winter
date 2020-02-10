def main_menu 
  p '============ Well come to my app! =============='
  p '1. Login'
  p '2. Register'
  p '3. Forgot Password'
  p '4. Exit'
  p 'Choose number:'
end

def screen1_for_member_lead
  p '============ Management ============='
  p '1. Team management'
  p '2. Leave management'
  p '3. Notification management'
  p '4. Logout'
  p '5. Shutdown program'
	p 'Choose number:'
	gets.chomp.to_i
end

def screen_menu_leave_for_root_and_member
  p '========== Leave Management ==========='
  p '1. Create a leave request'
  p '2. Show your leave request'
  p '3. Update a leave request'
  p '4. Send a leave request'
  p '5. Show list of leaves of employees in your team.'
  p '6. Return: Go to Level 1.'
  p '7. Logout: Go to Level 0.'
  p '8. Exit: Shutdown program.'
  p 'Choose number:'
  gets.chomp.to_i
end