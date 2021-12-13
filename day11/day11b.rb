cavern = {}
File.readlines('input.txt', chomp: true).each_with_index do |line, y|
  line.each_char.with_index do |char, x|
    cavern[[x, y]] = char.to_i
  end
end
step = 0
while true
  new_state = {}
  flashed = []
  cavern.each { |key, value| new_state[key] = value + 1 }
  until new_state.values.all? { |value| value < 10 }
    new_state.each do |key, value|
      next unless value > 9 && !flashed.include?(key)

      flashed << key
      [0, -1, 1].each do |x|
        [0, -1, 1].each do |y|
          next if x.zero? && y.zero?

          new_state[[key[0] + x, key[1] + y]] += 1 if new_state[[key[0] + x, key[1] + y]]
        end
      end
    end
    flashed.each { |key| new_state[key] = 0 }
  end
  step += 1
  cavern = new_state
  if flashed.size == cavern.values.size
    pp step
    break
  end
end
