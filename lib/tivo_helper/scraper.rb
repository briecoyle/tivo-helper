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
      name = show_info.css(".title").text.strip
      genre = show_info.css(".title + td").text.strip
      time = show_info.css("td:last-of-type").text.strip
      if !time.match(/^\d/) && time
        modified_time = time.split(", ")
        time = modified_time[1]
        network = modified_time[0]
      else
        network = show_info.css("td:last-of-type img").attribute("alt").value
      end
      TivoHelper::Show.new({name: name, genre: genre, time: time, network: network || "Netflix"})
    end
  end
end
