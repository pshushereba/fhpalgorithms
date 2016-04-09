require 'benchmark'

def recursive_fib(num)
  if num == 0
    return 0
  elsif num == 1
    return 1
  else
    @fib ||= { }
    @fib[num] ||= recursive_fib(num - 1) + recursive_fib(num - 2) 
  end
end

def iterative_fib(num)
  # i = 0
  # while i <= num
  #   iterative_fib(num - 1) + iterative_fib(num - 2)
  # end

  # a = 1
  # b = (num - 1) / 2
  # (a..b).map { |k| (num - k - 1) / k }.inject(&:+)
  r = [1]
  (1...num).each { 
    current, last = r.last(2)
    r.push current + (last || 0 )
  }
  r.last

end

num = 35
Benchmark.bm do |x|
  x.report("recursive_fib") { recursive_fib(num) }
  x.report("iterative_fib")  { iterative_fib(num) }
end

puts recursive_fib(150)
puts iterative_fib(150)