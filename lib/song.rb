class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file)
    artist, song, extension = file.split(" - ")
    instance = self.new(song)
    instance.artist = Artist.find_or_create_by_name(artist)
    instance.artist.save
    instance.artist.songs << song
    instance
  end
end
