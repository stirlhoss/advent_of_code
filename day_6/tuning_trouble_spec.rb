# tuning_trouble_spec.rb
require 'debug'
require 'pry'

signal = File.read('input.input').chars.map(&:strip)

window_size = 14

i = 0

first_start = []

signal.each_with_index.each_cons(window_size).find do |window|
  if window.map(&:first).uniq.length == window_size
    first_start = window[3][-1] + 1
    break
  end
end

puts first_start

# signal[window_size..-1].each do |char|
# end
