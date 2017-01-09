module TivoHelper
end

require 'open-uri'
require 'nokogiri'
require 'pry'

require_all "tivo_helper"

module Concerns
  module Findable
    def find_by_name(name)
      self.all.find {|s| s.name == name}
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) == nil ? self.create(name) : self.find_by_name(name)
    end
  end
end
