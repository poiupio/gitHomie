def calculate_numbers(numbers)
  sum=0
  numbers.each do |number|
    extracted_number = ""

    number.digits.each do |dgit|
      break if dgit.zero?
      extracted_number += dgit.to_s
    end
    
    next if extracted_number == ""
    sum += extracted_number.reverse().to_i
  end
  sum
end