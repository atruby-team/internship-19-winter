def root_menu
  p '============ Management ============='
  p '1. Team management'
  p '2. Leave management'
  p '3. Notification management'
  p '4. Logout'
  p '5. Shutdown program'
  p '6.CSV'
	p 'Choose number:'
	gets.chomp.to_i
end

def manage_team_of_root
  p '========== Team Management ==========='
  p '1. Create a new team(only root)'
  p '2. Show list of members'
  p '3. Return: Go to Level 1'
  p '4. Logout: Go to Level 0'
  p '5. Exit: Shutdown program'
  p 'Choose number:'
  gets.chomp.to_i
end
