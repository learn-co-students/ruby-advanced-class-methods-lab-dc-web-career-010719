require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    @@all << song
    song

  end

  def self.all
    @@all
  end

  def self.new_by_name(name)
    song = self.new
    song.name = (name)
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = (name)
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != name
      self.create_by_name(name)
    end
    return self.find_by_name(name)

  end

  def self.alphabetical
    return @@all.sort_by(&:name)
  end

  def self.new_from_filename(filename)
    artist = filename.split(" - ")[0]
    song = filename.split(" - ")[1].chomp(".mp3")
    new_song = self.new_by_name(song)
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(filename)
    new_song = new_from_filename(filename)
    new_song.save
    new_song
  end

  def self.destroy_all
    return @@all = []
  end
  
  def save
    self.class.all << self
  end
end
