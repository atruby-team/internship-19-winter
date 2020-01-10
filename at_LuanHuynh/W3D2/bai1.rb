class BbcNews

  def initialize (id, title, content, category)
    @id = id
    @title = title
    @content = content
    @category = category
    @news = {}
  end
   
  def new(id, title, content, category)
    @news["title: "] << title
    @news["content: "] << content
    @news["category: "] << category
    p @news
  end

  def update(bbc_news, title, content)

  end
  
  def delete(bbc_news)
    
  end

end

class CnnNews

  def initialize
    # @id
    # @title
    # @content
    # @publication_date
  end

  def new(id, title, content, publication_date)
    
  end

  def update(cnn_news, title, content)
    
  end

  def delete(cnn_news)
    
  end
    
end

class User

  def initialize
    # @id
    # @name
    # @friends
    # @messages
  end

  def subscribe(organisation)
    
  end

  def unsubscribe(organisation)
    
  end

  def subscription_list
    
  end

  def show_news(organisation)
    
  end

  def add_friend(user)
    
  end

  def unfriend(user)
    
  end

  def friends
    
  end

  def send_message(friend, message)
    
  end

  def conversation(friend)
    
  end
end

p bbc_new_01 = BbcNews.new(01, 'BBC first news', 'Hello world from BBC', 'Say hello') 
BbcNews.new