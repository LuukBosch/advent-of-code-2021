class BingoCard
  def initialize(numbers)
    @numbers = numbers
    @size = numbers.size
  end

  def evaluate_row_column(row, bingo_balls)
    count = 0
    row.each do |number|
      break unless bingo_balls.include?(number)

      count += 1
    end
    true if count == @size
  end

  def evaluate(bingo_balls)
    @numbers.each do |row|
      return score(bingo_balls) if evaluate_row_column(row, bingo_balls)
    end
    @size.times do |i|
      return score(bingo_balls) if evaluate_row_column(@numbers.transpose[i], bingo_balls)
    end
    false
  end

  def score(bingo_balls)
    ((@numbers.flatten - bingo_balls).map(&:to_i).reduce(:+) || 0) * bingo_balls.last.to_i
  end
end

first_line = true
boards = []
board = []
bingo_balls = nil

File.readlines('input.txt', chomp: true).each do |line|
  if first_line
    bingo_balls = line.split(',')
    first_line = false
  else
    next if line.empty?

    board << line.split(' ')
    if board.size == 5
      boards << BingoCard.new(board)
      board = []
    end
  end
end

(bingo_balls.size).times do |i|
  boards.each do |board|
    score = board.evaluate(bingo_balls[0..bingo_balls.size - i - 1])
    unless score
      pp board.evaluate(bingo_balls[0..bingo_balls.size - i])
      return
    end
  end
end

