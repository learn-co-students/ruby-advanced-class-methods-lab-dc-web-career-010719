require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(given_name)
  	song = self.new
  	song.name = (given_name)
  	song
  end

  def self.create_by_name(given_name)
  	song = self.create
  	song.name = (given_name)
  	song
  end

  def self.find_by_name(given_name)
    @@all.find do |x|
      x.name == given_name
    end
  end

  def self.find_or_create_by_name(given_name)
  	song = self.find_by_name(given_name)
  	if song == nil
  		song = self.create_by_name(given_name)
  	end
  	song
  end

  def self.alphabetical
  	@@all.sort do |a, b|
      a.name <=> b.name
  	end
  end

  def self.new_from_filename(filename)
    delimiters = [' - ', '.']
    split = filename.split(Regexp.union(delimiters))
    split.delete(" ")
    song = self.create_by_name(split[1])
    song.artist_name = (split[0])
	song
  end

  def self.create_from_filename(filename)
  	delimiters = [' - ', '.']
    split = filename.split(Regexp.union(delimiters))
    split.delete(" ")
    if split[-1] == "mp3"
	    song = self.create_by_name(split[1])
	    song.artist_name = (split[0])
		song
	end
  end

  def self.destroy_all
  	@@all.clear
  end

  def save
    self.class.all << self
  end
end
