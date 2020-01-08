class Array
  def sum
    each do | x |
      return nil if not (x.is_a?(Integer))
    end
    inject(0) { |sum, x| sum + x }
  end
end
p [1, 2, 3, "a"].sum
