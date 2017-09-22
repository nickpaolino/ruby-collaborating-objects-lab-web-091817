require "pry"

class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self if !@@all.include?(self)
  end

  def self.all
    @@all
  end

  def add_song(new_song)
    @songs << new_song
    song = Song.new(new_song)
    song.artist = self
  end

  def self.find_or_create_by_name(artist)
    self.all.find {|object| object.name == artist} || self.new(artist)
  end

  def print_songs
    @songs.each do |song|
      puts "#{song.name}\n"
    end
  end
end
