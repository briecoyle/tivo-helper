class TivoHelper::Network
  extend Concerns::Findable
  attr_accessor :name, :streaming
  @@all = []
end
