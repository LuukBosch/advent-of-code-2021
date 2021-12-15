def six_determination(string, inputs, one, four)
  return '6' unless string.include?(one[0]) && string.include?(one[1])

  four.each_char { |char| string.gsub!(char, '') }
  string.size == 2 ? '9' : '0'

end

def five_determination(string, inputs, one, four)
  return '3' if string.include?(one[0]) && string.include?(one[1])

  four.each_char { |char| string.gsub!(char, '') }
  string.size == 2 ? '5' : '2'
end

total = []
size_based_hash = { 2 => '1', 3 => '7', 4 => '4', 7 => '8' }
File.readlines('input.txt', chomp: true).each do |line|
  result = ''
  inputs = line.split('|').first.split(' ')
  output = line.split('|').last.split(' ')
  four = inputs.find { |input| input.size == 4 }
  one =  inputs.find { |input| input.size == 2 }
  output.each do |number|
    result += case number.length
              when 6
                six_determination(number, inputs, one, four)
              when 5
                five_determination(number, inputs, one, four)
              else
                size_based_hash[number.size]
              end
  end
  total << result
end

pp total.map(&:to_i).reduce(:+)






