class Dictionary
  attr_accessor :vocab, :desc
  attr_reader :hash
  
  def initialize
    @hash = Hash.new
    @count =Hash.new
  end

  def add(vocab,desc) 
    if @hash[vocab].nil?
      @hash[vocab] = desc
      @count[vocab] = 0
    end
  end

  def lookup(vocab) 
    if  @hash[vocab] != nil
      p @hash[vocab]
      @count[vocab] += 1
    else 
      p "#{vocab} not found"
      @count[vocab] = 1
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

  def random
    val = @hash[@hash.keys.sample]
    key =@hash.key(val)
    h_random= Hash.new 
    h_random[key] = val 
    p h_random
  end

  def favorite
    p @count.max_by{ |k, v| v}
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
dic.lookup("eat") #"xin chao"
dic.lookup("eat") #"xin chao"
dic.favorite
dic.size #"total vocabulary: 3"
dic.update("good bye", "Chao tam biet") #"updated good bye"
p dic.hash
dic.random
dic.pop
dic.pop
dic.pop
dic.size #"total vocabulary: 0"
