require 'debug'

schedule = File.readlines('input.input').map(&:strip).
  map { | s | s.split(',').map { | a | a.split('-').map(&:to_i) } }
  
complete_overlap = schedule.map do | sections |
  (sections[0][0] <= sections[1][0] and sections[0][1] >= sections[1][1]) or
  (sections[1][0] <= sections[0][0] and sections[1][1] >= sections[0][1])
end

partial_overlap = schedule.map do | sections | 
  not ((sections[0][1] < sections[1][0]) or 
  (sections[0][0] > sections[1][1]))
end

all_overlap_count = complete_overlap.find_all { | e | e == true }

partial_overlap_count = partial_overlap.find_all { | e | e == true }

puts all_overlap_count.count
puts partial_overlap_count.count
