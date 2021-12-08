field = {}
File.readlines('input.txt', chomp: true).each do |line|
  x1, y1, x2, y2 = line.scan(/\d+/).map(&:to_i)
  next if x1 == x2 && y1 == y2

  if x1 == x2
    min = y1 < y2 ? y1 : y2
    0.upto((y1 - y2).abs) do |i|
      field[[x1, min + i]] ||= 0
      field[[x1, min + i]] += 1
    end
  elsif y1 == y2
    min = x1 < x2 ? x1 : x2
    0.upto((x1 - x2).abs) do |i|
      field[[min + i, y1]] ||= 0
      field[[min + i, y1]] += 1
    end
  end
end

pp field.count{ |_, value| value > 1 }

