total_count = 0
File.readlines('example.txt', chomp: true).each do |line|
  content = line.split('|')[1].split(' ')
  total_count += content.count { |num| [2, 3, 4, 7].include?(num.length) }
end
pp total_count