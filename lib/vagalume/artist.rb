module Vagalume
  class Artist
    attr_accessor :id, :name, :url

    def initialize(artist)
      @id = artist["id"]
      @name = artist["name"]
      @url = artist["url"]
    end
  end
end
