def manage_team_of_member
  p '========== Team Management ==========='
  p '1. Show list of members'
  p '2. Return: Go to Level 1'
  p '3. Logout: Go to Level 0'
  p '4. Exit: Shutdown program'
  p 'Choose number:'
  gets.chomp.to_i
end
