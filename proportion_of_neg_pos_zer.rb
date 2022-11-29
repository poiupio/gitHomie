
def plusMinus(arr)
  numbers_size = arr.count
  
  positive_ocurrences = Rational(arr.count {|num| num.positive?}, numbers_size)
  negative_ocurrences = Rational(arr.count {|num| num.negative?}, numbers_size)
  zero_ocurrences = Rational(arr.count {|num| num.zero?}, numbers_size)

  p positive_ocurrences.to_f
  p negative_ocurrences.to_f
  p zero_ocurrences.to_f 
end

