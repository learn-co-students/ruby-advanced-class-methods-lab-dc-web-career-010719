require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    song = find_by_name(name)
    if !song
    return create_by_name(name)
    else
    return song
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    song_info = filename.split('.')
    name_and_artist = song_info[0].split(' - ')
    song = Song.new
    song.name = name_and_artist[1]
    song.artist_name = name_and_artist[0]
    song
  end

  def self.create_from_filename(filename)
    song_info = filename.split('.')
    name_and_artist = song_info[0].split(' - ')
    song = Song.new
    song.name = name_and_artist[1]
    song.artist_name = name_and_artist[0]
    song.save
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all = []
  end

end
