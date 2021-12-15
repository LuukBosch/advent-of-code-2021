fold_instructions = []
paper = {}
File.readlines('input.txt', chomp: true).each do |line|
  next if line.empty?

  if line.include?('fold')
    fold_instructions << line
  else
    x, y = line.split(',')
    paper[[x.to_i,y.to_i]] = '*'
  end
end

def fold_y_line(paper, y)
  folded_dots = paper.keys.filter{|key| key[1] > y}
  folded_dots.each do |dot|
    paper[[dot[0], (y - (dot[1] - y))]] = '#'
    paper.delete(dot)
  end
end

def fold_x_line(paper, x)
  folded_dots = paper.keys.filter{|key| key[0] > x}
  folded_dots.each do |dot|
    paper[[x - (dot[0] - x), dot[1]]] = '#'
    paper.delete(dot)
  end
end


fold_instructions.each do |instruction|
  pp instruction
  if instruction.include?("x")
    fold_x_line(paper, instruction.scan(/\d+/).first.to_i)
  elsif instruction.include?("y")
    fold_y_line(paper, instruction.scan(/\d+/).first.to_i)
  end
  pp paper.values.count
end

x_min = paper.min_by{|key, _| key[0]}.first[0]
x_max = paper.max_by{|key, _| key[0]}.first[0]
y_min = paper.min_by{|key, _| key[1]}.first[1]
y_max = paper.max_by{|key, _| key[1]}.first[1]
(y_min..y_max).each do |y|
  (x_min..x_max).each do |x|
    print paper[[x,y]] || " "
  end
  puts "\n"
end




