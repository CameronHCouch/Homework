# Our hungry octopus wants to find the largest fish in an array of fish
# Here it attempts to achieve this using different Big O time complexities

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# O(n^2)time using Bubble Sort
def sluggish_octopus(fish)
  sorted = false
  until sorted
    sorted = true
    fish.each_with_index do |ele, idx|
      next if idx == fish.length - 1
      current = ele
      neighbor = fish[idx + 1]
      if neighbor.length > current.length
        fish[idx] = neighbor 
        fish[idx + 1] = current
        sorted = false
      end
    end
  end

  fish.first
end

# O(n log n)time using Merge Sort
def dominant_longest_first(fish)
  dominant_octopus(fish).first
end

def dominant_octopus(fish)
  return fish if fish.length <= 1
  mid = fish.length / 2
  left_fish = fish.take(mid)
  right_fish = fish.drop(mid)
  merged_left_fish = dominant_octopus(left_fish)
  merged_right_fish = dominant_octopus(right_fish)

  sorted = fish_merge(merged_left_fish, merged_right_fish)
end

def fish_merge(left, right)
  merged = []
  until left.empty? || right.empty?
    if left.first.length < right.first.length
      merged << right.shift
    else
      merged << left.shift
    end
  end
  merged + left + right
end

# O(n)time storing longest val found until longer is found
def clever_octopus(fish)
  longest = ""
  fish.each do |item|
    longest = item if item.length > longest.length
  end
  longest
end


# DDR Octopus?
# Now the octopus is playing Dance Dance Revolution for some reason
# Dance tile buttons are shown below
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

# Slow Dance. O(n)time. Octopus iterates thru array to figure out which
# tentacle number to use (idx)

def slow_dance(target, tiles_array)
  tiles_array.each_with_index do |tile, idx|
    return idx if tile == target
  end
end

# Fast Dance. O(1)time. Target => Tentacle values are stored as hash,
# meaning we no longer need to iterate through an array

# gratefully copied from solution.rb
tiles_hash = {
  "up" => 0,
  "right-up" => 1,
  "right"=> 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def fast_dance(target, tiles_hash)
  tiles_hash[target]
end
