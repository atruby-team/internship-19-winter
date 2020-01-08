class Dictionary
  attr_accessor :vocab, :desc
  def initialize
    @hash = Hash.new
  end
  def hash
    @hash
  end
  def add(vocab,desc) 
    if @hash[vocab].nil?
      @hash.store(vocab,desc)
    end
  end
  def lookup(vocab) 
    if  @hash[vocab] !=nil
      p item = @hash[vocab]
    else 
      p "#{vocab} not found"
    end
  end
  def remove(vocab)
    if  @hash.has_key?(vocab) == true
      @hash.delete(vocab)
      p "removed #{vocab}"
    else
      p "#{vocab} not found"
    end
  end
  def size
    p "total vocabulary: #{@hash.length}"
  end
  def update(vocab,desc)
    if  @hash.has_key?(vocab) == true
      @hash.delete(vocab)
      add(vocab,desc)
      p "updated #{vocab}"
    else
      return nil
    end
  end
  def pop
    @hash.delete(@hash.key(@hash.values.last))
    p "Removed newest"
  end
end
dic = Dictionary.new
dic.add("hello", "xin chao")
dic.add("good bye", "tam biet")
dic.add("sleep", "ngu")
dic.add("eat", "an")
p dic.hash
dic.remove("sleep") #"removed sleep"
dic.remove("sleep") #"sleep not found"
p dic.hash
dic.lookup("hello") #"xin chao"
dic.size #"total vocabulary: 3"
dic.update("good bye", "Chao tam biet") #"updated good bye"
p dic.hash
dic.pop
dic.pop
dic.pop
dic.size #"total vocabulary: 0"
