#!/usr/bin/env ruby

require 'pp'

n = gets.to_i

def mark(a, r, c, y, x)
  return unless x < c && y < r
  if y > 0
    a[y*c+x-c-1] = 1 if x > 0
    a[y*c+x-c  ] = 1
    a[y*c+x-c+1] = 1 if x < c-1
  end
  a[y*c+x  -1] = 1 if x > 0
  a[y*c+x    ] = 1
  a[y*c+x  +1] = 1 if x < c-1
  if y < r-1
    a[y*c+x+c-1] = 1 if x > 0
    a[y*c+x+c  ] = 1
    a[y*c+x+c+1] = 1 if x < c-1
  end
  a.reduce(:+)
end

def dump(a, r, c)
  i = 0
  a[0] = 2
  r.times do
    c.times do
      print "*.c"[a[i]]
      i += 1
    end
    puts
  end
end

n.times do |i|
  r, c, m = gets.chomp.split.map(&:to_i)
  s = r*c-m
  t = 1
  a = Array.new(r*c, 0)
  a[0] = 1
  catch(:break) do
    (0...r).each do |y|
      (0...c).each do |x|
        t = mark(a, r, c, y, x)
        throw :break if t >= s
        break if t+3 == s
      end
    end
  end if t != s
  catch(:break) do
    t = 0
    a = Array.new(r*c, 0)
    (0...c).each do |x|
      (0...r).each do |y|
        t = mark(a, r, c, y, x)
        throw :break if t >= s
        break if t+3 == s
      end
    end
  end if t != s
  puts "Case ##{i+1}:"
  if t == s
    dump(a, r, c)
  else
    puts "Impossible"
  end
end
