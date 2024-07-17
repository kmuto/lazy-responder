require 'sinatra'

get '/' do
  "Hello World\n"
end

get %r{/sleep/(\d+)} do |sec|
  Kernel.sleep(sec.to_i)
  "Hello World after #{sec} seconds\n"
end

get %r{/stress/(\d)/(\d+)} do |cpu, sec|
  system("stress -c #{cpu} -t #{sec}")
  "Hello World after #{sec} seconds with stress #{cpu} CPUs\n"
end

get %r{/status/(\d+)} do |status|
  status status.to_i
  "Hello World with status #{status}\n"
end
