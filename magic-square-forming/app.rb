#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'formingMagicSquare' function below.
#
# The function is expected to return an INTEGER.
# The function accepts 2D_INTEGER_ARRAY s as parameter.
#

def formingMagicSquare(s)
  s.each do |row|
    row.each do |elem|
      if has_duplicate?(elem) || need_update?(elem)
        update(elem, s)
      end
    end
  end
end

def has_duplicate?(elem, s)
  s.find
end


s = [
  [5, 3, 4],
  [1, 5, 8],
  [6, 4, 2]
]

# 8 3 4
# 1 5 9
# 6 7 2

result = formingMagicSquare s

puts result
