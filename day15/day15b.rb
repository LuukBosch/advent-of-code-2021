cave = {}
File.readlines('example.txt', chomp: true).each_with_index do |line, y|
  (0..4).each do |x_step|
    (0..4).each do |y_step|
      line.each_char.with_index do |char, x|
        cave[[x + (x_step * line.length), y + (y_step * line.length)]] =
          (char.to_i + x_step + y_step) > 9 ? (char.to_i + x_step + y_step)%10 + 1 : (char.to_i + x_step + y_step)
      end
    end
  end
end

def neighbours(last, cave)
  neighbours= []
  neighbours <<  [last[0], last[1] + 1] if last[1] < (cave.keys.last[1])
  neighbours <<  [last[0] + 1, last[1]] if last[0] < (cave.keys.last[0])
  neighbours <<  [last[0], last[1] - 1] if last[1] > 0
  neighbours <<  [last[0] - 1, last[1]] if last[0] > 0

  neighbours
end

shortest_path = {}
shortest_path[[0, 0]] = 0

while true
  new_shortest_path = {}
  shortest_path.each do |key, value|
    neighbours = neighbours(key, cave)
    neighbours.each do |neighbour|
      cave_value = cave[neighbour]
      if new_shortest_path[neighbour]
        if new_shortest_path[neighbour] > (value + cave_value)
          new_shortest_path[neighbour] = (value + cave_value)
        end
      else
        new_shortest_path[neighbour] = (value + cave_value)
      end
    end
    new_shortest_path[key] = value
  end

  break if shortest_path == new_shortest_path
  shortest_path = new_shortest_path
end
pp shortest_path[cave.keys.last]



