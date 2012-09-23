require './operations'

puts 'OPERATIONS'
puts '----------'
puts

puts 'Using number sequence 1 2 3 4 5 6 7'
puts

puts 'Ways to get 100'
puts '---------------'
puts operation((1..7).to_a, 100)
puts

puts '1 way to get each number up to 100'
puts '----------------------------------'
(1..100).each do |i|
  puts operation((1..7).to_a, i, 1)
end
