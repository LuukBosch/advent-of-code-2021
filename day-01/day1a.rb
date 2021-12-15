previous_measurement = nil
count = 0
File.readlines('input.txt', chomp: true).each do |line|
  measurement = line.to_i
  count += 1 if previous_measurement && previous_measurement < measurement
  previous_measurement = measurement
end
pp count
