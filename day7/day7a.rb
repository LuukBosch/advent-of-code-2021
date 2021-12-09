crab_positions = []
File.readlines('example.txt', chomp: true).each do |line|
  crab_positions  = line.scan(/\d+/).map(&:to_i)
end
min = crab_positions.min
max = crab_positions.max

full_count = {}
(min..max).each do |position|
  full_count[position] = crab_positions.sum {|crab_position| (position-crab_position).abs}
end
pp full_count.min_by { |_, v| v }
