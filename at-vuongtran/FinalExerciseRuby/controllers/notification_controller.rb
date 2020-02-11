require_relative '../models/notification'
class NotificationController
  def self.send(user)
    puts `clear`
    p '=========Create A Notification========='
    p 'Enter title: '
    title = gets.chomp
    p 'Enter content:'
    content = gets.chomp
    Notification.new.add_notif(title, content, user.team_id)
	end
	
	def read; end

	def delete; end

	def notifications; end
end
