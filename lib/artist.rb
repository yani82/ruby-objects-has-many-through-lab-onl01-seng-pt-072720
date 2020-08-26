class Artist
  
  @@all = []
  
  attr_reader :name
  
  def initialize(name)
    @name = name
    @songs = []
    @genres = []
    @@all << self
  end
  
  def new_song(name, genre)
    song = Song.new(name, self, genre)
    song
  end
  
  def self.all
    @@all
  end
  
  def songs
    Song.all.select do |song|
      song.artist == self
    end
  end
  
  def genres
    self.songs.map do |song|
      song.genre
    end
  end
  
end