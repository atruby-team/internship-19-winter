class Dictionary

  def initialize
    @hash = Hash.new
  end

  def hash
    @hash
  end

  def add(vocab, des)
    @hash[vocab] ||= "" 
    @hash[vocab] = des if @hash[vocab] == ""
  end

  def lookup(vocab)
    temp = @hash[vocab] == nil ? "Not found in dictionary" : @hash[vocab]
    p vocab + ": " + temp
  end

  def remove(vocab)
    @hash.delete(vocab) if @hash[vocab] != nil
    puts "Delete Done!"
  end

  def size
    @hash.size
  end

  def random
    keys = @hash.keys
    key_random = keys[rand(keys.size)]
    p key_random + "=>" + @hash[key_random]
  end

  def pop
    return nil if size.zero? 
    keys = @hash.keys
    @hash.delete(keys[-1])
  end

  def update(vocab, des)
    @hash.each { |k , v| @hash[k] = des if k == vocab }
  end

end

dict = Dictionary.new
dict.add("love", "tinh yeu")
dict.lookup("loves")
dict.random
dict.add("friend", "ban be")
dict.add("friend2", "ban be")
dict.add("friend3", "ban be")
dict.update("friend2", "hello")
p "_______________"
p dict.hash