class TivoHelper::Genre
  extend Concerns::Findable
  attr_accessor :name
  @@all = []
end
