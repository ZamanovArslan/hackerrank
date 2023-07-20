#!/bin/ruby

require 'json'
require 'stringio'
require 'byebug'

#
# Complete the 'organizingContainers' function below.
#
# The function is expected to return a STRING.
# The function accepts 2D_INTEGER_ARRAY container as parameter.
#

def organizingContainers(containers)
  all = true

  containers.each_with_index do |container, index|
    exist = false

    sum_of_index = containers.sum { |container_1| container_1[index]}

    containers.each do |container_1|
      exist = true if sum_of_index == container_1.sum
    end

    all = false unless exist
  end
  all ? 'Possible' : 'Impossible'
end

fptr = File.open('file', 'r')

q = fptr.readline.to_i

q.times do |q_itr|
  n = fptr.readline.to_i

  container = Array.new(n)

  n.times do |i|
    container[i] = fptr.readline.split.map(&:to_i)
  end

  result = organizingContainers container

  puts result
end

