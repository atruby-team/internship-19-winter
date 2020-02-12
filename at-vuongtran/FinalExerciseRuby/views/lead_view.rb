def manage_team_of_lead
  p '========== Team Management ==========='
  p '1. Add a new member(only team lead)'
  p '2. Show list of members'
  p '3. Return: Go to Level 1'
  p '4. Logout: Go to Level 0'
  p '5. Exit: Shutdown program'
  p 'Choose number:'
  gets.chomp.to_i
end
