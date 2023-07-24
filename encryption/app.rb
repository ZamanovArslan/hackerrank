def encryption(s)
  rows = Math.sqrt(s.delete(' ').length).to_i
  columns = Math.sqrt(s.delete(' ').length).ceil

  a = ''

  columns.times do |i|
    result = ''

    s.delete(' ').split('').each_with_index do |symbol, index|
      result << symbol if index % columns == i
    end

    a << result
    a << ' '
  end
  a
end

#fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = 'chillout'

result = encryption s

puts result
