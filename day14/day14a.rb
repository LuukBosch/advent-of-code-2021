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
    mapping[pair] = insertsion
  end
end


step.times do
  new_template = []
  template.each_cons(2) do |char|
    new_template << char[0]
    new_template << mapping[char[0] + char[1]] if mapping[char[0] + char[1]]
  end
  template = new_template << template.last
end
count = template.tally
pp count.values.max - count.values.min


