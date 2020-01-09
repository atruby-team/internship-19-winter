def non_repeat(str)
  hash = {}
  arr = str.split("")
  arr.each do |key| 
    if hash[key] == nil
      hash[key] = 1 
    else
      hash[key] += 1
    end
    end
  item = hash.key(1)
  if item == nil
    -1 
  else
    arr.index(item)
  end
end

p non_repeat("asiantech")
p non_repeat("rubyteam")
p non_repeat("")