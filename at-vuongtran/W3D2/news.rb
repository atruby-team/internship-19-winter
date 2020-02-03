class News
  attr_accessor :tittle, :content
  @@list_new = []

  def initialize(id, tittle, content, tmp)
    @id = id
    @tittle = tittle
    @content = content
  end

  def self.update(news, tittle, content)
    news.tittle = tittle
    news.content = content
  end

  def self.delete(news)
    @@list_new.delete(news)
    p "delete ok"
  end
end
