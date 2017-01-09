class TivoHelper::Show
  extend Concerns::Findable
  attr_accessor :name, :genre, :network
  @@all = []

  def initialize
    @@all << self
  end

  def self.create_from_scraper(scraper_data)
    
  end

  def self.all
    @@all
  end

  def self.sort_by_time
    @@all
  end

  def self.sort_by_genre

  end

  def self.sort_by_network

  end
end
