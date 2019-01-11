require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end


  def self.new_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
      song = self.new_by_name(song_name)
      # song.save
      song
  end

  def self.find_by_name(song_name)
    @@all.find {|song|
      song_name == song.name
    }
  end

  def self.find_or_create_by_name(song_name)

    if @@all.include?(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
      self.find_by_name(song_name)
      end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
  song = self.new_by_name(filename.chomp('.mp3').split(' - ')[1])
  song.artist_name = (filename.chomp('.mp3').split(' - ')[0])
  song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
