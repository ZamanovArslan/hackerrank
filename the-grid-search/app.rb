#!/bin/ruby

require 'json'
require 'stringio'
require 'byebug'

#
# Complete the 'gridSearch' function below.
#
# The function is expected to return a STRING.
# The function accepts following parameters:
#  1. STRING_ARRAY G
#  2. STRING_ARRAY P
#

def gridSearch(g, p)
  suitable_indexes = {}

  g.each do |row|
    suitable_indexes = suitable_indexes.map do |suitable_index, count|
      slice = row[suitable_index..(suitable_index + p.size)]


      [suitable_index, count + 1] if slice == p[count + 1 - 1] || count >= p.size
    end.compact.to_h

    row.split('').to_a[0..(-p.size - 1)].each_index do |index|
      slice = row[index..(index+p.size)]

      if slice == p[0]
        suitable_indexes[index] = (suitable_indexes[index] || 1)
      end
    end
  end

  suitable_indexes.find { |a, count| count >= p.count }  ? 'YES' : 'NO'
end

fptr = File.open('file', 'r')

t = fptr.readline.to_i

t.times do |t_itr|
    first_multiple_input = fptr.readline.split

    rows = first_multiple_input[0].to_i

    columns = first_multiple_input[1].to_i

    grid = Array.new(rows)

    rows.times do |i|
        grid_item = fptr.readline.chomp

        grid[i] = grid_item
    end

    second_multiple_input = fptr.readline.split

    r = second_multiple_input[0].to_i

    c = second_multiple_input[1].to_i

    pattern = Array.new(r)

    r.times do |i|
        pattern_item = fptr.readline.chomp

        pattern[i] = pattern_item
    end

    result = gridSearch grid, pattern

    puts result
end

fptr.close()
