require_relative './scraper.rb'
class TivoHelper::Show
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
      new_show = TivoHelper::Show.new
      new_show.name = this_name
      new_show.genre = this_genre
      new_show.time = this_time
      new_show.network = (this_network || "Netflix")
    end
    binding.pry
  end

  def self.all
    @@all
  end

  def self.genres
    @@genres.uniq!
  end

  def self.networks
    @@networks.uniq!
  end

  def self.sort_by_time
    self.all
  end

  def find_by_name(name)
    self.all.detect {|show| show.name == name}
  end

  def self.find_all_by_genre(genre)
    self.all.find_all {|show| show.genre == genre}
  end

  def self.find_all_by_network(network)
    self.all.find_all {|show| show.network == network}
  end

  def self.sort_by_genre
    self.genres.each do |genre|
      self.find_all_by_genre(genre)
    end
  end

  def self.sort_by_network
    self.networks.each do |genre|
      self.find_all_by_genre(genre)
    end
  end

  def genre=(genre)
    @genre = genre
    @@genres << genre
  end

  def network=(network)
    @network = network
    @@networks << network
  end
end

TivoHelper::Scraper.new.make_shows
