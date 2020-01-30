require_relative 'bbc_news'
require_relative 'cnn_news'

class User
  attr_accessor :name, :id, :friends, :replace_name, :conventation, :list_names

  def initialize(id , name)
    @id = id
    @name = name
    @replace_name = "#{name}(#{id})"
    @friends = []
    @subscribe_list = []
    @conventation = []
  end
  
  def add_friend(user)
    unless friends.include?(user)
      friends << user
      user.friends << self;
    end
  end

  def unfriend(user)
    index_tmp = friends.index(user)
    list_names.delete_at(index_tmp) if index_tmp.nil?
    index_tmp2 = user.friends.index(self)
    user.list_names.delete_at(index_tmp2) if index_tmp2.nil?
    friends.delete(user)
    user.friends.delete(self)
  end

  def subscribe(news)
    @subscribe_list << news if @subscribe_list.index(news).nil?
  end

  def unsubscribe(news)
    @subscribe_list.delete(news)
  end

  def subscription_list
    print @subscribe_list
    puts
  end

  def name
    @name
  end

  def friends_list
    list_names = []
    hash = {}
    friends.each do |item|
      if hash[item.name].nil?
        hash[item.name] = 1
      else
        hash[item.name] += 1
      end
      list_names << item.name 
    end
    list_names.each_with_index do |value, index|
      next if hash[value] == 1
      list_names[index] = friends[index].replace_name
    end
    p list_names
  end

  def send_message(friend, message)
    if friends.include?(friend)
      messenger = [self, friend, message]
      @conventation << messenger
      friend.conventation << [self, friend, message]
    end
  end

  def conversation(friend)
    unless friends.include?(friend)
      p []
      return
    end
    arr = @conventation.select { |item | item[0] == friend && item[1] == self || item[1] == friend && item[0] == self }
    result = arr.map { | item | [item[0].name , item[2]] }
    p result
  end
  
  def show_news(news_channel)
    if @subscribe_list.include?(news_channel)
      if news_channel.list_new.size > 10
        print news_channel.list_new.slice(-10, 10)
      else
        print news_channel.list_new
      end
    else
      puts "channel is empty!"
    end
  end
end

bbc_news_01 = BbcNews.new(01, "BBC first news", "Hello world from BBC", "Say hello")
bbc_news_02 = BbcNews.new(02, "BBC second news", "Hello Ruby from BBC", "Say hello")
bbc_news_03 = BbcNews.new(02, "BBC third news", "Hello AsianTech from BBC", "Say hello")

cnn_news_01 = CnnNews.new(01, "CNN first news", "Hello world from CNN", "06/07/2018")
cnn_news_02 = CnnNews.new(02, "CNN second news", "Hello Ruby from CNN", "06/07/2018")
cnn_news_03 = CnnNews.new(02, "CNN third news", "Hello AsianTech from CNN", "06/07/2018")

BbcNews.update(bbc_news_02, "BBC second news!", "Hello Ruby from Asiantech")
BbcNews.delete(bbc_news_01)

CnnNews.update(cnn_news_02, "CNN second news!", "Hello Ruby from Asiantech")
CnnNews.delete(cnn_news_03)

first_user = User.new(01, "Bob")
second_user = User.new(02, "Smith")
third_user = User.new(03, "Bob")
	
first_user.subscribe(BbcNews)
second_user.subscribe(CnnNews)
third_user.subscribe(CnnNews)
third_user.subscribe(BbcNews)

second_user.unsubscribe(CnnNews)

first_user.subscription_list # [BbcNews]
second_user.subscription_list # []
third_user.subscription_list # [CnnNews, BbcNews]

first_user.add_friend(second_user)
first_user.add_friend(third_user)
second_user.add_friend(third_user)

third_user.unfriend(first_user)

first_user.friends_list # ["Smith"]
second_user.friends_list # ["Bob(01)", "Bob(03)"]
third_user.friends_list # ["Smith"]

first_user.send_message(second_user, "Hello!aa")
second_user.send_message(first_user, "Hi! what's up?")
first_user.send_message(second_user, "I just came to say hello. sss")
second_user.send_message(first_user, "...")

second_user.conversation(first_user)
# [{ "Bob" => "Hello!" },
#  { "Smith" => "Hi! what"s up?" },
#  { "Bob" => "I just came to say hello."}
#  { "Smith" => "..." }]
	
first_user.send_message(third_user, "Hello!")
first_user.send_message(third_user, "I just came to say hello.")
first_user.conversation(third_user) # []
third_user.conversation(first_user) # []