class News
  @@list_news = []

  def self.update(bbc_news, new_title, new_content)
    bbc_news.title = new_title
    bbc_news.content = new_content
  end
  
  def self.delete(news)
    class_name = news.class.name
    @@list_news.each do |item|
      @@list_news.delete(item) if item.id = news.id && item.type == class_name #don't finish
    end    
  end

  def self.list_news
    @@list_news
  end

end

class BbcNews < News

  def initialize(id, title, content, category)
    @title = title
    @id = id
    @content = content
    @category = category
    @@list_news << { id: id, title: title, content: content, category: category, type: BbcNews.name }
    p @@list_news
  end

end

class CnnNews < News
  attr_accessor :publication_date

  def initialize(id, title, content, publication_date)
    @title = title
    @id = id
    @content = content
    @publication_date = publication_date
    @@list_news << { id: id, title: title, content: content, publication_date: publication_date, type: CnnNews.name }
    p @@list_news
  end

end

class Users
  attr_accessor :friends, :messages, :name, :id, :list_friend

  def initialize (id, name)
    @subscription_list = []
    @list_friend = []
    @id = id
    @name = name
  end

  def subscribe(organisation)
    if @subscription_list.include?(organisation) == true
      p "#{organisation} is exist"
    else 
      @subscription_list += [organisation]
    end
  end  


  def unsubscribe(organisation)
    if @subscription_list.include?(organisation) == true
      subscription_list.delete(organisation)
    else
      p "#{organisation} is not exist"
    end
  end

  def subscription_list
    p @subscription_list
  end

  def show_news(organisation) #don't finish
  end

  def add_friend(user)
    if @list_friend.include?(user.name) == false
      @list_friend += [user.name]
      user.list_friend += [self.name]
      p "done!"
      p @list_friend
      p user.list_friend
    else 
      p "#{user.name} was friend"
    end
  end

end

bbc_new_01 = BbcNews.new(01, 'BBC first news', 'Hello world from BBC', 'Say hello') 
bbc_new_02 = BbcNews.new(02, 'BBC second news', 'Hello world from BBC', 'Say hello')
cnn_new_01 = CnnNews.new(01, 'CNN first news', 'Hello world from CNN', 'Say hello')
# News.delete(bbc_new_01)( error: undefined method `id' for #<BbcNews:0x0000556c142efbf0>)
#BbcNews.update(bbc_new_01, 'BBC first news!', 'Hello Ruby from Asiantech') 
#error: undefined method `title=' for #<BbcNews:0x000055e7c1848100> 
p News.list_news 
first_user = Users.new(01, 'Bob')
first_user.subscription_list
second_user = Users.new(02, 'Smith')
third_user = Users.new(03, 'Bob')
first_user.subscribe(BbcNews)
third_user.subscribe(CnnNews)
third_user.subscribe(CnnNews)
third_user.subscribe(BbcNews)
third_user.unsubscribe(CnnNews)
first_user.subscription_list
second_user.subscription_list
third_user.subscription_list
# first_user.list_news(BbcNews)
first_user.add_friend(second_user)
first_user.add_friend(second_user)
