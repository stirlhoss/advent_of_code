# rock_paper_scicors_spec.rb
require 'debug'
values = File.readlines('input.input').map(&:split)

def score_round(elf, me)
  outcome = {
    %w[A X] => 3,
    %w[A Y] => 6,
    %w[A Z] => 0,
    %w[B X] => 0,
    %w[B Y] => 3,
    %w[B Z] => 6,
    %w[C X] => 6,
    %w[C Y] => 0,
    %w[C Z] => 3
  }

  play_score = {
    'X' => 1,
    'Y' => 2,
    'Z' => 3
  }

  outcome[[elf, me]] + play_score[me]
end

total_score = values.map do | v |
  score_round v[0], v[1]
end
puts total_score.sum
