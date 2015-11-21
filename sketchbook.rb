require 'benchmark'
require_relative 'cpu/fib'
require_relative 'io/speller'

# puts Benchmark.measure {
#    50.times do
#     fib(30)
#   end
# }

# puts Benchmark.measure {
#   10.times do
#     TEXT.each do |text|
#       spell text
#     end
#   end
# }

# [Thread]

# @i = 0
#
# def add n
#   result = @i + n
#   sleep rand(0.5..1)
#   @i = result
# end
#
# debit = Thread.new do
#   add 10
# end
#
# credit = Thread.new do
#   add 20
# end
#
# debit.join
# credit.join
# puts @i


# [Process]

# [pid]
# Process.pid
# $$
# getpid

# [fileno and standard streams]
# Process.getrlimit(:NOFILE)
# Process.getrlimit(:NPROC)

# [Environment]
# [Exit codes]
# at_exit{}
# exit!
# abort
# raise

# [fork]
# [CoW]
# [wait]
# [wait2]
# fork {}
#
# sleep 1
# p Process.wait2

# [trap]
# child_processes = 3
# dead_processes = 0
#
# child_processes.times do
#   fork do
#     sleep 3
#   end
# end
#
# trap(:CHLD) do
#   puts Process.wait
#   dead_processes += 1
#   exit if dead_processes == child_processes
# end
#
# loop do
#   puts "[fib]: #{fib rand(10..20)}"
#   sleep 1
# end

# [trap on dead]
# child_processes = 3
# dead_processes = 0
#
# child_processes.times do
#   fork do
#     sleep 3
#   end
# end
#
# $stdout.sync = true
#
# trap(:CHLD) do
#   begin
#     while pid = Process.wait(-1, Process::WNOHANG)
#       puts pid
#       dead_processes += 1
#       exit if dead_processes == child_processes
#     end
#   rescue Errno::ECHILD
#   end
# end
#
# loop do
#   puts "[fib]: #{fib rand(10..20)}"
#   sleep 1
# end


# loop do
#   sleep 1
#   puts "i'm alive!"
#   trap(:INT) do
#     puts "You can't kill me, ha-ha"
#   end
# end

# reader, writer = IO.pipe
# fork do
#   reader.close
#   10.times do
#     writer.puts 'Hello from a child process'
#   end
# end
#
# writer.close
# while message = reader.gets
#   $stdout.puts message
# end


