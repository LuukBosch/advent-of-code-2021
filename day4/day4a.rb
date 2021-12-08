require 'set'

class BingoCard
  def initialize(numbers)
    @numbers = numbers
  end

  def evaluate_row_column(row, bingo_balls)
    count = 0
    row.each do |number|
      break unless bingo_balls.include?(number)

      count += 1
    end
    true if count == 5
  end

  def evaluate(bingo_balls)
    @numbers.each do |row|
      return score(bingo_balls) if evaluate_row_column(row, bingo_balls)
    end
    5.times do |i|
      return score(bingo_balls) if evaluate_row_column(@numbers.transpose[i], bingo_balls)
    end
    false
  end

  def score(bingo_balls)
    (@numbers.flatten - bingo_balls).map(&:to_i).reduce(:+) * bingo_balls.last.to_i
  end
end

first_line = true
boards = []
board = []
bingo_balls = nil
count = 0

File.readlines('example.txt', chomp: true).each do |line|
  if first_line
    bingo_balls = line.split(',')
    first_line = false
  else
    next if line.empty?

    count += 1
    board << line.split(' ')
    if count == 5
      boards << BingoCard.new(board)
      board = []
      count = 0
    end
  end
end

(bingo_balls.size - 5).times do |i|
  boards.each do |board|
    score = board.evaluate(bingo_balls[0..i + 4])
    if score
      pp score
      return
    end
  end
end
