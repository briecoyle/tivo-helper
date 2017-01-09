class TivoHelper::Show
  attr_accessor :title, :genre, :network
  @@all = []

  def self.all
    #@@all
    puts <<-DOC
    1. Coin Heist - Thriller - Netflix
    2. Emerald City - Drama - NBC, 9p
    3. Ginormous Food - Reality - Food, 8p
    DOC
  end
end
