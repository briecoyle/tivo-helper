require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative "tivo_helper/version"
require_relative "tivo_helper/show"
require_relative "tivo_helper/cli"

module Concerns
  module Findable
    def find_by_name(name)
      self.all.find {|song| song.name == name}
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) == nil ? self.create(name) : self.find_by_name(name)
    end
  end
end
