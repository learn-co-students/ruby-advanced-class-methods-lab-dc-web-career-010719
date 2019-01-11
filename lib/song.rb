class Song
  attr_accessor :name, :artist_name

  @@all = []

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
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    #find all songs
    #sort songs by name
    self.all.sort_by { |song| song.name}
  end

  def self.new_from_filename(filename)
    filename.slice!(".mp3")
    formatted_file = filename.split(" - ")
    song_name = formatted_file[1]
    artist_name = formatted_file[0]
    new_song_by_artist = new_by_name(song_name)
    new_song_by_artist.artist_name = artist_name
    new_song_by_artist
  end

  def self.create_from_filename(filename)
    filename.slice!(".mp3")
    formatted_file = filename.split(" - ")
    song_name = formatted_file[1]
    artist_name = formatted_file[0]
    new_song_by_artist = create_by_name(song_name)
    new_song_by_artist.artist_name = artist_name
    new_song_by_artist
  end

  def self.destroy_all
    self.all.clear
  end
  def self.all
    @@all
  end


  def save
    self.class.all << self
  end



end
