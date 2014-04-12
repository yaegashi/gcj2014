#!/usr/bin/env ruby

require 'pp'

def deceitful_war(nb, kb, np, kp, len, memo)
  return 0 if len.zero?
  key = "#{np}:#{kp}:#{len}"
  return memo[key] if memo.has_key?(key)
  if nb[np] > kb[kp]
    pt = 1 + deceitful_war(nb, kb, np+1, kp+1, len-1, memo)
  else
    pt0 = deceitful_war(nb, kb, np+1, kp+1, len-1, memo)
    pt1 = deceitful_war(nb, kb, np+1, kp, len-1, memo)
    pt = pt0 > pt1 ? pt0 : pt1
  end
  return memo[key] = pt
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
  puts "Case ##{i+1}: #{deceitful_war(nb, kb, 0, 0, n, {})} #{war(nb, kb)}"
end
