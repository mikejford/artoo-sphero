require 'artoo'
require 'benchmark'

connection :sphero, :adaptor => :sphero, :port => '127.0.0.1:4560'
device :sphero, :driver => :sphero

work do
  n = 10
  Benchmark.bm(10) do |x|
    for i in 1..n do
      x.report("Roll:") { sphero.roll 255, 0 }
      Kernel::sleep 2
      x.report("Stop:") { sphero.stop }
    end
  end
end
