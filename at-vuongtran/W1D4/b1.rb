def non_repeat(str)
  hash = {}
  str.each_char { |item| hash[item].nil? ? hash[item] = 1 : hash[item] += 1 }
  hash.each { | item , index | return index if hash[item] == 1 }
  -1
end

p non_repeat("asiantech")