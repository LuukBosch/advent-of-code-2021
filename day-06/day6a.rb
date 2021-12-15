initial_state = []
days = 80
File.readlines('input.txt', chomp: true).each do |line|
  initial_state = line.scan(/\d+/).map(&:to_i)
end
days.times do
  new_state = []
  initial_state.each do |fish|
    if fish.zero?
      new_state << 6
      new_state << 8
    else
      fish -= 1
      new_state << (fish)
    end
  end
  initial_state = new_state
end
pp initial_state.size
