require 'benchmark'
require_relative 'speller'

threads = []

puts Benchmark.measure {
  10.times do
    TEXT.each do |text|
      threads << Thread.new do
        spell text
      end
    end
  end
  threads.each &:join
}