

class Rules

  def initialize; end

  def check_valid_move(grid_index, board)
    check_valid_cell(grid_index, board)
    check_untaken_cell(grid_index, board)
  end

  def draw?(board)
    board.grid.all? { |row| row.all? { |cell| cell != :' ' } }
  end

  def victory?(board)
    return true if row_win?(board)
    return true if col_win?(board)
  end

  # make private when sorted

  def get_diagonal_of(board)
     Matrix.rows(board).each(:diagonal).to_a
  end

  def left_diagonal_win?(board)
     victory(get_diagonal_of(board))
  end

  private

  def check_valid_cell(index, board)
    puts "That's not a valid cell" unless board.grid[index[Parser::ROW_POSITION]][index[Parser::COL_POSITION]]
  end

  def check_untaken_cell(index, board)
    puts 'That cell is already taken' unless board.grid[index[Parser::ROW_POSITION]][index[Parser::COL_POSITION]] == :' '
  end

   def victory(cells)
    cells == [:X, :X, :X] || cells == [:O, :O, :O]
  end

  def row_win?(board)
    board.grid.any? { |row| victory(row) }
  end

  def col_win?(board)
    board.grid.transpose.any? { |col| victory(col) }
  end
end
