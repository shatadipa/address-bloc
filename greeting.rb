def greeting
  ARGV.each {|x|
    puts "Hey #{x}"
  }
end

greeting