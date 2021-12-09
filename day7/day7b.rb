crab_positions = []
File.readlines('input.txt', chomp: true).each do |line|
  crab_positions  = line.scan(/\d+/).map(&:to_i)
end
full_count = {}
(crab_positions.min..crab_positions.max).each do |position|
  full_count[position] = crab_positions.sum {|crab_position| (0..(position-crab_position).abs).inject(:+)}
end
pp full_count.min_by { |_, v| v }
