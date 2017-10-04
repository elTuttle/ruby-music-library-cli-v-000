class MusicLibraryController

  attr_accessor :music_importer

  def initialize(path='./db/mp3s')
    @music_importer = MusicImporter.new(path)
    @music_importer.import
  end

  def call
    puts "Welcome to your music library!"


    do
      input = gets.chomp
    end  while input != "exit"


  end

end
