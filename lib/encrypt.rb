require './lib/enigma'
new_message = File.open(ARGV[0]).read.chomp
enigma = Enigma.new

if ARGV[2] == nil
  ARGV[2] = enigma.key
end

if ARGV[3] == nil
  ARGV[3] = enigma.date
end

coded_message = enigma.encrypt(new_message, ARGV[2], ARGV[3])
File.write(ARGV[1], coded_message[:encryption])
puts "Created #{ARGV[1]} with the key #{ARGV[2]} and date #{ARGV[3]}"
