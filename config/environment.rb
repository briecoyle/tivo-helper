require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative "../lib/tivo_helper/scraper"
require_relative "../lib/tivo_helper/show"
require_relative "../lib/tivo_helper/genre"
require_relative "../lib/tivo_helper/network"
require_relative "../lib/tivo_helper/cli"
require_relative "../lib/tivo_helper/version"

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
