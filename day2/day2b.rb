horizontal_position = 0
depth = 0
aim = 0
File.readlines('example.txt', chomp: true).each do |line|
  if line.include?('forward')
    x = line[/\d+/].to_i
    horizontal_position += x
    depth += (aim * x)
  elsif line.include?('down')
    aim += line[/\d+/].to_i
  elsif line.include?('up')
    aim -= line[/\d+/].to_i
  end
end
pp horizontal_position * depth
