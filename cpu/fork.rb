require 'benchmark'
require_relative 'fib'

puts Benchmark.measure {
  50.times do
    fork do
      fib(30)
    end
  end
  Process.waitall
}

