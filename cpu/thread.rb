require 'benchmark'
require_relative 'fib'

threads = []

puts Benchmark.measure {
  50.times do
    threads << Thread.new do
      fib(30)
    end
  end
  threads.each &:join
}

