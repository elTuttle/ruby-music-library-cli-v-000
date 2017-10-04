class MusicLibraryController

  attr_accessor :music_importer

  def initialize(path='./db/mp3s')
    @music_importer = MusicImporter.new(path)
    @music_importer.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."

    input = gets.chomp
    until input == "exit"

      input = gets.chomp
    end

  end

end
