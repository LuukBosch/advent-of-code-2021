days = 256
initial_count = { 0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 0, 8 => 0 }
fishes = []

File.readlines('input.txt', chomp: true).each do |line|
  fishes = line.scan(/\d+/).map(&:to_i)
end

fishes.each { |fish| initial_count[fish] += 1 }


days.times do
  new_state = {}
  0.upto(8).each do |i|
    new_state[i] = if i == 6
                     (initial_count[0] + initial_count[(i + 1) % 9])
                   else
                     initial_count[(i + 1) % 9]
                   end
  end
  initial_count = new_state
end

pp initial_count.values.reduce(:+)
