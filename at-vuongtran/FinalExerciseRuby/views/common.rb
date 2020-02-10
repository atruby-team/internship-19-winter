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
