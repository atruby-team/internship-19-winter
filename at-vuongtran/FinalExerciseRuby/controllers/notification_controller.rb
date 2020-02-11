require_relative '../models/notification'
class NotificationController
  def send(user)
    puts `clear`
    p '=========Create A Notification========='
    p 'Enter title: '
    title = gets.chomp
    p 'Enter content:'
    content = gets.chomp
    Notification.new.add_notif(title, content, user.team_id)
	end
	
  def read id
    arr = Notification.new.get_item id
    puts `clear`
    p '=========Detail notification========='
    arr.each do |item|
      print "#{item['id']}.  #{item['title']}: \n #{item['content']} \n #{item['public_date']}"
    end
  end

  def delete id
    Notification.new.delete_item id
    p "Delete success"
  end

  def notifications team_id
    arr = Notification.new.get_list team_id
    p '=========Detail notification========='
    arr.each do |item|
      puts "#{item['id']}. #{item['title']} update at: #{item['public_date']}"
    end
  end
end
