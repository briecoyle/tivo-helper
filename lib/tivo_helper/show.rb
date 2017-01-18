class TivoHelper::Show
  attr_accessor :name, :genre, :network, :time
  @@all = []
  @@genres = []
  @@networks = []

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.genres
    @@genres.uniq
  end

  def self.networks
    @@networks.uniq
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
