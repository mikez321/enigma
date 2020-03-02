require './lib/enigma'
encrypted_message = File.open(ARGV[0]).read.chomp
enigma = Enigma.new
decoded_message = enigma.decrypt(encrypted_message, ARGV[2], ARGV[3])
File.write(ARGV[1], decoded_message[:decryption])
puts "Created #{ARGV[1]} with the key #{enigma.key} and date #{enigma.date}"
