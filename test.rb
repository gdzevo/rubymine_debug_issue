require 'fileutils'

class MyError < StandardError; end

def method
  puts 'before exception'
  FileUtils.cd 'un-existing'
  puts 'never happen'
rescue => e
  puts "Caught in method: #{e}"
  raise MyError, e, e.backtrace
end

begin
  method
rescue MyError => e
  puts "Caught: #{e}"
end
