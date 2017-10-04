class MusicLibraryController

  attr_accessor :music_importer

  def initialize(path='./db/mp3s')
    @music_importer = MusicImporter.new(path)
    @music_importer.import
  end

  def call
    puts "Welcome to your music library!"

    until input == "exit"
      
    end
      input = gets.chomp
    end  input != "exit"


  end

end
