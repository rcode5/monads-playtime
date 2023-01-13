#!/usr/bin/env ruby

require './monads.rb'

def svc
  MyService.new
end

def run_find(val)
  puts "find('#{val}')"
  result = svc.find(val)
  case result
  when Dry::Monads::Success
    result.value!
  when Dry::Monads::Failure
    puts "FAILED!"
    result.value!
  else
    puts "UNHANDLED"
  end
end

def run_check_val(val)
  puts "find('#{val}')"
  result = svc.check_val(val)
  case result
  when Dry::Monads::Success
    result.value!
  when Dry::Monads::Failure
    puts "FAILED!"
    result.value!
  else
    puts "UNHANDLED"
  end
end

%w(one a nomatch).each do |s|
  run_find(s)
  run_check_val(s)
end
