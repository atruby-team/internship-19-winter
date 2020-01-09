class News

  attr_accessor :tittle, :content

  def initialize(id, tittle, content, tmp)
    @id = id
    @tittle = tittle
    @content = content    
  end

  def self.update(news, tittle, content)
    news.tittle = tittle
    news.content = content
  end

  def delete(news)
  end
end

class BbcNews < News

  def initialize(id, tittle, content, category)
    super
    @category = category
  end

end

class CnnNews < News

  def initialize(id, tittle, content, publication_date)
    super
    @publication_date = publication_date
  end

end

class User

  attr_accessor :name, :id, :friends

  def initialize(id , name)
    @id = id
    @name = name
    @friends = Array.new
    @subscribe_list = Array.new
    @conventation = Array.new
  end

  def friends=(user)
    find_name = @friends.find { | item | item[0].name == user.name }
    if find_name.nil?
      replace_name = user.name + "(" + String(user.id) + ")" 
    else
      replace_name = user.name
    end
    @friends << [user, replace_name]
  end

  def conventation=(hash)
    @conventation << hash
  end
  
  def add_friend(user)
    temp = @friends.find { | item | item[0] == user }
    if temp.nil?
      find_name = @friends.find { | item | item[0].name == user.name }
      if find_name.nil?
        replace_name = user.name + "(" + String(user.id) + ")" 
      else
        replace_name = user.name
      end
      @friends << [user, replace_name]
      user.friends = self;
    end
  end

  def unfriend(user)
    @friends.delete(user)
  end

  def subscribe(news)
    @subscribe_list << news if @subscribe_list.index(news).nil?
  end

  def unsubscribe(news)
    @subscribe_list.delete(news)
  end

  def subscription_list
    print @subscribe_list
  end

  def friends
    list_names = @friends.map { | item | item[1] }
    p list_names
  end

  def is_friend(user)
    tmp = @friends.find { | item | item[0] == user }
    tmp.nil? ? nil : tmp[1]
  end

  def send_message(friend, message)
    unless is_friend(friend).nil?
      messenger = [self, friend, message]
      @conventation << messenger
      friend.conventation = [self, friend, message]
    end
  end

  def conversation(friend)
    arr = @conventation.select { |item | item[0] == friend || item[1] == friend }
    result = arr.map { | item | [item[0].name , item[2]] }
    p result
  end
  
end







bbc_news_01 = BbcNews.new(01, "BBC first news", "Hello world from BBC", "Say hello")
bbc_news_02 = BbcNews.new(02, "BBC second news", "Hello Ruby from BBC", "Say hello")
bbc_news_03 = BbcNews.new(02, "BBC third news", "Hello AsianTech from BBC", "Say hello")

cnn_news_01 = CnnNews.new(01, "CNN first news", "Hello world from CNN", "06/07/2018")
cnn_news_02 = CnnNews.new(02, "CNN second news", "Hello Ruby from CNN", "06/07/2018")
cnn_news_03 = CnnNews.new(02, "CNN third news", "Hello AsianTech from CNN", "06/07/2018")

BbcNews.update(bbc_news_02, "BBC second news!", "Hello Ruby from Asiantech")
# BbcNews.delete(bbc_news_01)

CnnNews.update(cnn_news_02, "CNN second news!", "Hello Ruby from Asiantech")
# CnnNews.delete(cnn_news_03)

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

first_user.friends # ["Smith"]
second_user.friends # ["Bob(01)", "Bob(03)"]
third_user.friends # ["Smith"]

first_user.send_message(second_user, "Hello!")
second_user.send_message(first_user, "Hi! what's up?")
first_user.send_message(second_user, "I just came to say hello.")
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