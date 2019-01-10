require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    # @@all << song
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song  end

  def self.find_by_name(name)
    self.all.find{ |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name}
  end

  def self.new_from_filename(filename)
    raw_info = filename.split(' - ')
    song_name = raw_info[1].split('.')[0]
    song = self.create_by_name(song_name)
    song.artist_name = raw_info[0]
    song
  end

def self.create_from_filename(file)
  raw_info = file.split(' - ')
  song_name = raw_info[1].split('.')[0]
  song = self.create_by_name(song_name)
  song.artist_name = raw_info[0]
  self.all << song
  song
end

def self.destroy_all
  @@all = []
end


end
