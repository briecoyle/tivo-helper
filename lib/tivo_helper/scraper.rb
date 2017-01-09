class TivoHelper::Scraper
  def load_page
    html = open("http://www.metacritic.com/feature/tv-premiere-dates", "User-Agent" => "Brie Coyle")
    Nokogiri::HTML(html)
  end

  def scrape_page
    self.load_page.css(".even")
  end

  def make_shows
    scrape_page.each do |show_info|
      TivoHelper::Show.create_from_scraper(show_info)
    end
  end
end
