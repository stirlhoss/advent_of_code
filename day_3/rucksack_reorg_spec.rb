require 'debug'
require 'set'

def priority(item)
  case item
  when 'a'..'z'
    item.ord - 96
  when 'A'..'Z'
    item.ord - 64 + 26
  end
end

rucksacks = File.readlines('input.input').map(&:strip).
  map { |items| [items[..items.length / 2 - 1], items[items.length / 2..]]  }.
  map { |items| Set.new(items[0].chars) & Set.new(items[1].chars) }.
  map(&:to_a).
  map { |duplicate| priority(duplicate[0]) }.
  reduce(:+)

puts rucksacks
