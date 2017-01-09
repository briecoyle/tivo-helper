class TivoHelper::Show
  attr_accessor :title, :genre, :network
  @@all = []

  def self.all
    #@@all
    show_1 = self.new
    show_1.title = "Coin Heist"
    show_1.genre = "Thriller"
    show_1.network = "Netflix"

    show_2 = self.new
    show_2.title = "Emerald City"
    show_2.genre = "Drama"
    show_2.network = "NBC"

    show_3 = self.new
    show_3.title = "Ginormous Food"
    show_3.genre = "Reality"
    show_3.network = "Netflix"

    [show_1, show_2, show_3]
  end
end
