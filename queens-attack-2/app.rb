require 'byebug'

def queensAttack(n, k, r_q, c_q, obstacles)
  result = 0

  right_direction = count_cells((c_q + 1)..n, obstacles, r_q, true)
  left_direction = count_cells((1..(c_q - 1)).to_a.reverse, obstacles, r_q, true)

  top_direction = count_cells((r_q + 1)..n, obstacles, c_q, false)
  bottom_direction = count_cells((1..(r_q - 1)).to_a.reverse, obstacles, c_q, false)

  right_top = count_cells_diagonal((c_q + 1)..n, obstacles, r_q + 1, true, n)
  right_bottom = count_cells_diagonal((c_q + 1)..n, obstacles, r_q - 1, false, n)

  left_top = count_cells_diagonal((1..(c_q - 1)).to_a.reverse, obstacles, r_q + 1, true, n)
  left_bottom = count_cells_diagonal((1..(c_q - 1)).to_a.reverse, obstacles, r_q - 1, false, n)

  left_direction + right_direction + top_direction + bottom_direction + right_top + right_bottom + left_top + left_bottom
end

def count_cells(range, obstacles, queen_cord, queen_cord_row)
  count = 0
  range.each do |direction|
    break if obstacle_present?(obstacles, queen_cord_row ? [queen_cord, direction] : [direction, queen_cord])

    count += 1
  end
  count
end

def count_cells_diagonal(range, obstacles, queen_cord, queen_cord_row, n)
  count = 0
  range.each_with_index do |direction, index|
   
    break if (queen_cord_row ? queen_cord + index > n : queen_cord - index < 1) || obstacle_present?(obstacles, queen_cord_row ? [queen_cord + index, direction] : [queen_cord - index, direction])

    count += 1
  end
  count
end

def obstacle_present?(obstacles, cords)
  obstacles[cords.join(',')]
end

fptr = File.open('file_1', 'r')

first_multiple_input = fptr.readline.split

n = first_multiple_input[0].to_i

k = first_multiple_input[1].to_i

second_multiple_input = fptr.readline.split

r_q = second_multiple_input[0].to_i

c_q = second_multiple_input[1].to_i

obstacles = Hash.new

k.times do |i|
  pos = fptr.readline.split.map(&:to_i)

  obstacles[pos.join(',')] = pos
end

result = queensAttack n, k, r_q, c_q, obstacles

puts result
