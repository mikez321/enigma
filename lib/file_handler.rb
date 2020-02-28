class FileHandler
  attr_reader :file, :message
  def initialize(file)
    @file = file
    @message = nil
  end

  def create_message
    @message = File.open(file).read.chomp
  end

end
