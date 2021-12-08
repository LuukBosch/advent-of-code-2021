numbers = []
File.readlines('example.txt', chomp: true).each do |line|
  numbers << line
end

def number_generator(numbers, i, decider)
  if numbers.size == 1
    numbers.first.to_i(2)
  else
    ones = []
    zeros = []
    numbers.each do |number|
      number.slice(i) == '1' ? ones << number : zeros << number
    end
    case decider
    when :oxygen_decider
      number_generator(oxygen_decider(zeros, ones), i += 1, decider)
    else
      number_generator(co2_decider(zeros, ones), i += 1, decider)
    end
  end
end

def oxygen_decider(zeros, ones)
  ones.size >= zeros.size ? ones : zeros
end

def co2_decider(zeros, ones)
  zeros.size <= ones.size ? zeros : ones
end

pp number_generator(numbers, 0, :oxygen_decider) * number_generator(numbers, 0, :co2_decider)

