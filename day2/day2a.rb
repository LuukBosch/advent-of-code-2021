horizontal_position = 0
depth = 0
File.readlines('example.txt', chomp: true).each do |line|
  if line.include?('forward')
    horizontal_position += line[/\d+/].to_i
  elsif line.include?('down')
    depth += line[/\d+/].to_i
  elsif line.include?('up')
    depth -= line[/\d+/].to_i
  end
end
pp horizontal_position * depth