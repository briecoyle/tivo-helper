class Genre
  attr_accessor :name, :shows
  @@all = []

  def initialize
    @songs = []
    @@all << self
  end

  def self.create(name)
    @name = name
    @songs = []
    @@all << self
  end

  def self.all
    @@all
  end

  def find_by_name(name)
    self.all.find {|s| s.name == name}
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) == nil ? self.create(name) : self.find_by_name(name)
  end

  def add_show(show)
    if !self.shows.include?(show)
      self.shows << show
    else
      self.shows.find(show)
    end
    show.genre = self if show.genre == nil
  end
end
