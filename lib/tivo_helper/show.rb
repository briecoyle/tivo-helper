require_relative './scraper.rb'
require_relative './genre.rb'
require_relative './network.rb'

class Show
  attr_accessor :name, :genre, :network, :time
  @@all = []
  @@genres = []
  @@networks = []

  def initialize
    @@all << self
  end

#This works! Leave it alone!
  def self.create_from_scraper(scraper_data)
    scraper_data.each do |listing|
      this_name = listing.css(".title").text.strip
      this_genre = listing.css(".title + td").text.strip
      this_time = listing.css("td:last-of-type").text.strip
      if !this_time.match(/^\d/) && this_time
        modified_time = this_time.split(", ")
        this_time = modified_time[1]
        this_network = modified_time[0]
      else
        this_network = listing.css("td:last-of-type img").attribute("alt").value
      end
      new_show = Show.new
      new_show.name = this_name
      new_show.genre = Genre.find_or_create_by_name(this_genre)
      new_show.time = this_time
      new_show.network = Network.find_or_create_by_name(this_network || "Netflix")
    end
    binding.pry
  end

  def self.all
    @@all
  end

  def self.sort_by_time
    @@all
  end

  def self.sort_by_genre
    genres = self.all.collect {|show| show.genre}.uniq
  end

  def self.sort_by_network
    networks = self.all.collect {|show| show.network}.uniq
  end

  # def network=(network)
  #   @network = network
  #   network.add_show(self)
  # end
  #
  # def genre=(genre)
  #   @genre = genre
  #   genre.add_show(self)
  # end

  def find_by_name(name)
    self.all.find {|s| s.name == name}
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) == nil ? self.create(name) : self.find_by_name(name)
  end
end

Show.create_from_scraper(Scraper.new.scrape_page)
