previous_measurement = nil
count = 0
File.readlines('input.txt', chomp: true).each_cons(3) do |line|
  measurement = line.map(&:to_i).reduce(:+)
  count += 1 if previous_measurement && previous_measurement < measurement
  previous_measurement = measurement
end
pp count

