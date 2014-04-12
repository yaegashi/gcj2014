#!/usr/bin/env ruby

require 'pp'

n = gets.to_i

n.times do |i|
  c, f, x = gets.chomp.split.map(&:to_f)
  s = 2.0
  t = x/s
  b = 0.0
  loop do
    b += c/s
    s += f
    u = b + x/s
    break if u > t
    t = u
  end
  puts "Case ##{i+1}: #{t}"
end
