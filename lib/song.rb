class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name=nil, artist_name=nil)
    self.name = name   
    self.artist_name = artist_name 
  end

  def self.new_by_name(name=nil)
    self.new(name)    
  end

  def self.new_from_filename(filename)
    split_filename = filename.split(' - ')
    artist_name = split_filename[0]
    song_name = split_filename[1].split('.')[0]
    self.new(song_name, artist_name)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    return song
  end

  def self.create(name=nil)
    song = self.new_by_name(name)
    song.save
    return song
  end

  def self.create_by_name(name)
    self.create(name)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end
  
  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort { |song1, song2| song1.name <=> song2.name }
  end

  def save
    self.class.all << self
  end
end
