require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    new_song = self.new
    new_song.save
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    new_song.save
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    case self.find_by_name(name)
    when nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(name)
    new_song = self.new
    new_song.artist_name = parse_songname(name)[0]
    new_song.name = parse_songname(name)[1]
    new_song
  end

  def self.create_from_filename(name)
    new_song = new_from_filename(name)
    new_song.save
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
    self  #Changed this to return itself to enhance utility
  end

private

  #Returns array of: [0] = artist_string, [1] = songname_string
  def self.parse_songname(name)
    no_file_extension = name.split('.')[0]
    no_file_extension.split(' - ')
  end

end
