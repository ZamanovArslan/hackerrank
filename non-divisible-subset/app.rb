#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'nonDivisibleSubset' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER k
#  2. INTEGER_ARRAY s
#

def nonDivisibleSubset(k, s)
  results = Array.new(k)

  s.each do |elem|
    results[elem % k] = (results[elem % k] || 0) + 1
  end

  selected = []
  i = 0
  sum_0 = results.delete_at(0)

  sum = if results.size == 1
    1
  else
    results[0..(results.size/2 - 1)].sum do |elem, count|
      elem_2 = results[results.size - i - 1]
      i += 1

      [elem || 0, elem_2 || 0].max
    end
  end

  sum += 1 if sum_0
  sum += 1 if results.count.odd? && results[0..((results.size/2.0).round - 1)] && results.size != 1

  sum
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

first_multiple_input = gets.rstrip.split

n = first_multiple_input[0].to_i

k = first_multiple_input[1].to_i

s = gets.rstrip.split.map(&:to_i)

result = nonDivisibleSubset k, s

fptr.write result
fptr.write "\n"

fptr.close()
