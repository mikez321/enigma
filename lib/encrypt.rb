require './lib/enigma'
new_message = File.open(ARGV[0]).read.chomp
enigma = Enigma.new

coded_message = enigma.encrypt(new_message, ARGV[2], ARGV[3])
File.write(ARGV[1], coded_message[:encryption])
puts "Created #{ARGV[1]} with the key #{coded_message[:key]} and date #{coded_message[:date]}"
