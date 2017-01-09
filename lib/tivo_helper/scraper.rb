require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper
  def load_page
    html = open("http://www.metacritic.com/feature/tv-premiere-dates", "User-Agent" => "Brie Coyle")
    Nokogiri::HTML(html)
  end

  def scrape_page
    premiere_page = self.load_page
    premiere_page.css(".even")
  end
end

Scraper.new.scrape_page
