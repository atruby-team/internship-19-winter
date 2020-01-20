def non_repeat(str)
  hash = {}
  str.each_char { |item| hash[item].nil? ? hash[item] = 1 : hash[item] += 1 }
  key_result = hash.key(1)
  key_result.nil? ? -1 : str.index(key_result);
end

p non_repeat("asiantech")
