cave = {}
File.readlines('input.txt', chomp: true).each_with_index do |line, y|
  line.each_char.with_index do |char, x|
    cave[[x, y]] = char.to_i
  end
end

low_points = []
cave.each do |key, value|
  sides = []
  sides << cave[[key[0], key[1] + 1]]
  sides << cave[[key[0] + 1, key[1]]]
  sides << cave[[key[0] - 1, key[1]]]
  sides << cave[[key[0], key[1] - 1]]
  low_points << value + 1 if sides.all? { |side| side.nil? || side > value }
end
pp low_points.reduce(:+)

