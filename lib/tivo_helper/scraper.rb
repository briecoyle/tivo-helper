require 'pry'
require 'nokogiri'
require 'open-uri'

class TivoHelper::Scraper
  def load_page
    html = open("http://www.metacritic.com/feature/tv-premiere-dates", "User-Agent" => "Brie Coyle")
    Nokogiri::HTML(html)
  end

  def scrape_page
    premiere_page = self.load_page
    try = premiere_page.css("table")
    binding.pry
  end
end

Scraper.new.scrape_page
