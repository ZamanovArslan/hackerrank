#!/bin/ruby

require 'json'
require 'byebug'

#
# Complete the 'connectedCell' function below.
#
# The function is expected to return an INTEGER.
# The function accepts 2D_INTEGER_ARRAY matrix as parameter.
#

def connectedCell(matrix)
    areas = []

    matrix.each_with_index do |row, row_index|
        row.each_with_index do |element, index|
            if element == 1
                if !(closest_area_indexes = find_closest_area_indexes(areas, index, row_index)).empty?
                    if closest_area_indexes.size > 1
                        union_areas(areas, closest_area_indexes, index, row_index)

                        update_area(areas, closest_area_indexes.first, index, row_index)
                    else
                        update_area(areas, closest_area_indexes.first, index, row_index)
                    end
                else
                    add_area(areas, index, row_index)
                end
            end
        end
    end

    return 0 if areas.empty?
    puts areas.to_s

    areas.max_by do |area|
        area.size
    end.size
end

def add_area(areas, index, row_index)
    areas << [[index, row_index]]
end

def update_area(areas, area_index, index, row_index)
    areas[area_index] << [index, row_index]
end

def union_areas(areas, closest_area_indexes, index, row_index)
    areas[closest_area_indexes.first] = closest_area_indexes[0..-1].map { |i| areas[i] }.reduce(&:|)
    closest_area_indexes[1..-1].each { |i| areas.delete_at(i) }
end

# def union_areas(areas)
#     areas.each_with_index do |area_1, index_1|
#         areas.each_with_index do |area_2, index_2|
#             return if index_1 == index_2

#             area
#         end
#     end

def find_closest_area_indexes(areas, index, row_index)
    result = []

    areas.each_with_index do |area, result_index|
      area.each do |coordinates|
        if coordinates == [index - 1, row_index - 1] || coordinates == [index, row_index - 1] ||
            coordinates == [index - 1, row_index] || coordinates == [index + 1, row_index - 1]

            result << result_index

            break
        end
      end
    end

    result
end

matrix = [[1, 1, 0, 0], [0, 1, 1, 0], [0, 0, 1, 0], [1, 0, 0, 0]]

# matrix = [[1, 0, 1], [0, 1, 0]]

result = connectedCell matrix

puts result.to_s
