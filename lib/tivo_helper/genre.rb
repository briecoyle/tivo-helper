require 'pry'

class Genre
  attr_accessor :name, :shows
  @@all = []

  def initialize
    @shows = []
    @@all << self
  end

  def self.create(name)
    @name = name
    @shows = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    this_genre = self.find_by_name(name)
    if !this_genre
       this_genre = self.create(name)
     end
     this_genre
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
