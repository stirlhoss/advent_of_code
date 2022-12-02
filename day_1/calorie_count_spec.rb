#!/usr/bin/env ruby
require 'pry'

values = File.read('input.input').lines.map(&:to_i)

elf_calories = Hash.new 0
elf = 0 

values.each do |value|
  if value.zero?
    elf += 1
  else
    elf_calories[elf] += value
  end
end

max_cal = elf_calories.max_by{ |elf , c | c}

print max_cal
