require 'byebug'

def climbingLeaderboard(ranked, player)
  result = Array.new(player.size)

  i = 1
  position = 1
  ranked_counter = 0
  added_last = false
  prev_rank = ranked[0]

  while i <= player.size do
    score = player[-i]

    if score >= prev_rank
      result[-i] = position
      i += 1
      next
    end

    ranked[ranked_counter..-1].each do |rank|
      if rank != prev_rank
        position += 1
      end
      if score >= rank
        prev_rank = rank
        break
      end
      prev_rank = rank
      ranked_counter += 1
    end


    if ranked.last > score && !added_last
      position += 1
      added_last = true
    end

    result[-i] = position
    i += 1
  end
  result
end

# player = [5, 25, 50, 120]
# ranked = [100, 100, 50, 40, 40, 20, 10]

# puts climbingLeaderboard(ranked, player).to_s

# player = [50, 65, 77, 90, 102]
# ranked = [100, 90, 90, 80, 75, 60]

# puts climbingLeaderboard(ranked, player).to_s

player = [5, 6, 7, 8, 9]
ranked = [100, 90, 90, 80, 75, 60]

puts climbingLeaderboard(ranked, player).to_s
