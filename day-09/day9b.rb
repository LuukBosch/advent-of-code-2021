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
  low_points << key if sides.all? { |side| side.nil? || side > value }
end

basins = []
low_points.each do |key|
  basin = []
  basin << key
  neighbours = [[key[0], key[1] + 1], [key[0] + 1, key[1]], [key[0] - 1, key[1]], [key[0], key[1] - 1]]
  until neighbours.empty?
    new_neighbours = []
    neighbours.each do |neighbour|
      if cave[neighbour] && cave[neighbour] != 9 && !basin.include?(neighbour)
        new_neighbours << [neighbour[0], neighbour[1] + 1]
        new_neighbours << [neighbour[0] + 1, neighbour[1]]
        new_neighbours << [neighbour[0] - 1, neighbour[1]]
        new_neighbours << [neighbour[0], neighbour[1] - 1]
        basin << neighbour
      end
    end
    neighbours = new_neighbours
  end
  basins << basin
end
pp basins.map{|basin| basin.size}.max(3).reduce(:*)


