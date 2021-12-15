opposites = { "[": ']', "{": '}', "(": ')', "<": '>', "]": '[', "}": '{', ")": '(', ">": '<' }
opens = %w|{ [ < (|
score_card = { "]": 2, "}": 3, ")": 1, ">": 4 }
scores = []
File.readlines('input.txt', chomp: true).each do |line|
  expected = []
  breaked = false
  line.each_char do |char|
    if opens.include?(char)
      expected << opposites[char.to_sym]
    elsif expected.last == char
      expected.pop
    else
      breaked = true
      break
    end
  end
  next if breaked

  score = 0
  expected.reverse_each do |char|
    score *= 5
    score += score_card[char.to_sym]
  end
  scores << score
end
pp scores.sort[scores.length / 2]
