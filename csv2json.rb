#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

require 'csv'
require 'json'

lines = CSV.open(ARGV[0], encoding: "Shift_JIS:UTF-8").readlines
keys = lines.first
puts keys[0]

File.open(ARGV[1], 'w') do |f|
  hash = Hash.new
  data = lines.map do |values|
    hash[values[0]] = values[1]
  end
  f.puts JSON.pretty_generate(hash)
end
