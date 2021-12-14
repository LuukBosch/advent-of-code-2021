first_line = true
template = []
mapping = {}
step = 40
File.readlines('input.txt', chomp: true).each do |line|
  next if line.empty?

  if first_line
    template = line.split('')
    first_line = false
  else
    pair, insertsion = line.split(' -> ')
    mapping[pair.split('')] = [[pair[0], insertsion], [insertsion, pair[1]]]
  end
end

count = {}
template.each_cons(2) do |char|
  count[[char[0], char[1]]] ||= 0
  count[[char[0], char[1]]] += 1
end
char_count = template.tally


step.times do
  new_count = {}
  count.each do |key, value|
    added = mapping[key]
    if added
      added.each do |add|
        new_count[add] ||= 0
        new_count[add] += value
      end
      char_count[added.first[1]] ||= 0
      char_count[added.first[1]] += value
    else
      new_count[key] ||= 0
      new_count[key] += value
    end
  end
  count = new_count
end

pp char_count.values.max - char_count.values.min



