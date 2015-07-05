# Given a Sudoku data structure with size NxN, N > 0 and √N == integer, write a method to validate if it has been filled out correctly.
#
# The data structure is a multi-dimensional Array, ie:
#
# [
#   [7,8,4,  1,5,9,  3,2,6],
#   [5,3,9,  6,7,2,  8,4,1],
#   [6,1,2,  4,3,8,  7,5,9],
#
#   [9,2,8,  7,1,5,  4,6,3],
#   [3,5,7,  8,4,6,  1,9,2],
#   [4,6,1,  9,2,3,  5,8,7],
#
#   [8,7,6,  3,9,4,  2,1,5],
#   [2,4,3,  5,6,1,  9,7,8],
#   [1,9,5,  2,8,7,  6,3,4]
# ]
# Rules for validation
#
# Data structure dimension: NxN where N > 0 and √N == integer
# Rows may only contain integers: 1..N (N included)
# Columns may only contain integers: 1..N (N included)

class Sudoku
  def initialize(sudoku)
    @sudoku=sudoku
  end

  def check_columns?(sorted_sudoku_members)
    begin
      columns=@sudoku.transpose
    rescue
     return false
    end
    columns.each do |row|
      return false if row.uniq.sort != sorted_sudoku_members
    end
     true
  end

  def check_rows?(sorted_sudoku_members)
    @sudoku.each do |row|
      return false if row.uniq.sort != sorted_sudoku_members
    end
     true
  end

  def check_size?
    @sudoku.each do |row|
        return false if row.length!=@sudoku.length
    end
     true
  end

  def is_valid
    sorted_sudoku_members=(1..@sudoku.length).to_a
    check_columns?(sorted_sudoku_members)&&check_rows?(sorted_sudoku_members)&&check_size?
  end
end
