opposites = { "[": ']', "{": '}', "(": ')', "<": '>', "]": '[', "}": '{', ")": '(', ">": '<' }
opens = %w|{ [ < (|
score_card = { "]": 57, "}": 1197, ")": 3, ">": 25137 }
score = 0
File.readlines('input.txt', chomp: true).each do |line|
  expected = []
  line.each_char do |char|
    if opens.include?(char)
      expected << opposites[char.to_sym]
    elsif expected.last == char
      expected.pop
    else
      score += score_card[char.to_sym]
      break
    end
  end
end
pp score