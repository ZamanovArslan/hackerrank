#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'timeInWords' function below.
#
# The function is expected to return a STRING.
# The function accepts following parameters:
#  1. INTEGER h
#  2. INTEGER m
#

def timeInWords(h, m)
  return "#{humanize_number(h)} o' clock" if m == 0
  return "#{humanize_number(m)} #{humanize_minutes(m) unless [15, 30].include? m} past #{humanize_number(h)}".gsub('  ', ' ') if m >= 1 && m <= 30
  return "#{humanize_number(60 - m)} #{humanize_minutes(m) unless [45].include? m} to #{humanize_number(h + 1)}".gsub('  ', ' ')
end

def humanize_minutes(m)
  return 'minutes' if m > 1

  'minute'
end

def humanize_number(number)
  return numeric(number) if (0..19).include? number
  return 'half' if number == 30
  return 'quarter' if number == 45
  return "twenty #{numeric(number % 10)}" if 20 <= number && number < 30
end

def numeric(number)
  {
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    14 => 'fourteen',
    15 => 'quarter',
    16 => 'sixteen',
    17 => 'seventeen',
    18 => 'eighteen',
    19 => 'nineteen',
  }[number]
end

h = '5'
m = '45'

result = timeInWords h.to_i, m.to_i

puts result
