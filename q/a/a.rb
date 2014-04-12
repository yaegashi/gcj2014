#!/usr/bin/env ruby

require 'pp'

n = gets.to_i

n.times do |i|
  ar = gets.to_i
  a = []
  4.times do
    a << gets.chomp.split.map(&:to_i)
  end
  br = gets.to_i
  b = []
  4.times do
    b << gets.chomp.split.map(&:to_i)
  end
  # pp ar, a, br, b
  c = a[ar-1] & b[br-1]
  answer =
    case c.size
    when 0
      "Volunteer cheated!"
    when 1
      c.first
    else
      "Bad magician!"
    end
  puts "Case ##{i+1}: #{answer}"
end
