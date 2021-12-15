number_count = 0
bit_count = []
File.readlines('input.txt', chomp: true).each do |line|
  number_count += 1
  line.each_char.with_index do |char, index|
    bit_count[index] ||= 0
    bit_count[index] += char.to_i
  end
end
gamma_rate = ''
threshold = number_count / 2

bit_count.each { |value| gamma_rate += value > threshold ? '1' : '0' }

pp gamma_rate.to_i(2) * gamma_rate.tr('01', '10').to_i(2)

