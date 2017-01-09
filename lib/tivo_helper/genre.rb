class TivoHelper::Genre
  extend Concerns::Findable
  attr_accessor :name, :shows
  @@all = []

  def initialize
    @songs = []
    @@all << self
  end

  def self.all
    @@all
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
