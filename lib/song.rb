require 'pry'

class Song

  def self.create
    song = self.new
    song.save 
    song 
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    # if self.find_by_name(name)
    #   self.find_by_name(name)
    # else 
    #   self.create_by_name(name)
    # end
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    # @@all.sort { |a,b| a.name <=> b.name }
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    # split_filename = filename.slice(0, filename.length-4).split(' - ')
    split_filename = filename.chomp(".mp3").split(' - ')
    song = self.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end

  def self.create_from_filename(filename)
    split_filename = filename.chomp(".mp3").split(' - ')
    song = self.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end
  
  def self.all
    @@all
  end

  attr_accessor :name, :artist_name
  @@all = []

  def save
    self.class.all << self
  end

end
