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
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file_format)
    song = self.new
    song.name = file_format.split(/\- |\.mp3/)[1]
    song.artist_name = file_format.split[0]
    song
  end

  def self.create_from_filename(file_format)
    song = Song.new
    song.name = file_format.split(/\- |\.mp3/)[1]
    song.artist_name = file_format.split[0]
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
