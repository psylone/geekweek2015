require 'benchmark'
require_relative 'speller'

puts Benchmark.measure {
  10.times do
    TEXT.each do |text|
      fork do
        spell text
      end
    end
  end
  Process.waitall
}

