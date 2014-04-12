#!/usr/bin/env ruby

require 'pp'

def deceitful_war(nb, kb)
  len = nb.length
  return 0 if len.zero?
  if nb.first > kb.first
    nb0 = nb.slice(1,len-1)
    kb0 = kb.slice(1,len-1)
    return 1 + deceitful_war(nb0, kb0)
  else
    nb0 = nb.slice(1,len-1)
    kb0 = kb.slice(1,len-1)
    pt0 = deceitful_war(nb0, kb0)
    nb1 = nb.slice(1,len-1)
    kb1 = kb.slice(0,len-1)
    pt1 = deceitful_war(nb1, kb1)
    return pt0 > pt1 ? pt0 : pt1
  end
end

def war(nb, kb)
  nb = nb.dup
  kb = kb.dup
  pt = 0
  while !nb.empty?
    if nb.last > kb.last
      nb.pop
      kb.shift
      pt += 1
    else
      nb.pop
      kb.pop
    end
  end
  pt
end

t = gets.to_i
t.times do |i|
  n = gets.to_i
  nb = gets.chomp.split.map(&:to_f).sort
  kb = gets.chomp.split.map(&:to_f).sort
  # pp nb,kb
  puts "Case ##{i+1}: #{deceitful_war(nb, kb)} #{war(nb, kb)}"
end
