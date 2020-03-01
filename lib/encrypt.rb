require './lib/enigma'
new_message = File.open(ARGV[0]).read.chomp
enigma = Enigma.new(new_message, ARGV[2], ARGV[3])
coded_message = enigma.encrypt(new_message, enigma.key, enigma.date)
File.write(ARGV[1], coded_message[:encryption])
puts "Created #{ARGV[1]} with the key #{enigma.key} and date #{enigma.date}"
