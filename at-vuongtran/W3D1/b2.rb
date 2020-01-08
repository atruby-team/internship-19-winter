class Dictionary

  def initialize
    @hash = Hash.new
    @finds = Hash.new
  end

  def add(vocab, des)
    @hash.store(vocab, des) if @hash[vocab].nil?
  end

  def lookup(vocab)
    if @hash[vocab].nil?
      p vocab + ": Not found in dictionary"
      return
    end
    if @finds[vocab].nil?
      @finds[vocab] = 1
    else
      @finds[vocab] +=1
    end
    p vocab + ": " + @hash[vocab]
  end

  def remove(vocab)
    @hash.delete(vocab) if not @hash[vocab].nil?
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
    key_end= @hash.keys[-1]
    value_end = @hash.delete(key_end)
    result = { key_end => value_end }
    result
  end

  def update(vocab, des)
    @hash.each { |k , v| @hash[k] = des if k == vocab }
  end

  def favorite
    max_view = @finds.values.max
    list_views = @finds.select { | k, v | v == max_view }  #tra ve mang cac gia tri duoc tim kiem nhieu nhat
    key_older = list_views.first[0]
    p @hash.slice(key_older)
  end
end

dict = Dictionary.new
dict.add("abc", "xyz")
dict.add("abd", "xyz")
dict.add("aaa", "xyz")
dict.lookup("abc")
dict.lookup("aaa")
dict.lookup("aaa")
dict.favorite
