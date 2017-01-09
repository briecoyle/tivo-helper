class TivoHelper::Show
  extend Concerns::Findable
  attr_accessor :name, :genre, :network
  @@all = []

  def initialize
    @@all << self
  end

  def self.create_from_scraper(scraper_data)
    scraper_data.css(".even").each do |show_info|
      show_info.each do |listing|
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
        new_show.genre = this_genre
        new_show.time = this_time
        new_show.network = this_network || "Netflix"
        binding.pry
      end
    end
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

  def network=(network)
    @network = network
    network.add_show(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_show(self)
  end
end

TivoHelper::Show.create_from_scraper(TivoHelper::Scraper.new.scrape_page)
