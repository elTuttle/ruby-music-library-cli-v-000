class Song
  extend Findable


  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name,a=nil,g=nil)
    @name = name
    if a != nil
      self.artist=(a)
    end
    if g != nil
      self.genre=(g)
    end
    @@all << self
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end

  def self.new_from_filename(filename)
    artist, song, genre = filename.split(" - ")
    new_artist = Artist.new(artist)
    new_genre = Genre.new(genre)
    new_song = self.find_or_create_by_name(song)
    new_song.artist = new_artist
    new_song.genre = new_genre
    new_song
  end

  def artist
    @artist
  end

  def artist=(artist)
    if @artist != artist
      @artist = artist
    end
    if !artist.songs.include?(self)
      artist.add_song(self)
    end
  end

  def genre=(genre)
    if @genre != genre
      @genre = genre
    end
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    created_song = Song.new(name)
  end

end
