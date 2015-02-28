module Vagalume
  class Artist
    attr_accessor :id, :name, :url

    def initialize(artist_json)
      @id = artist_json["id"]
      @name = artist_json["name"]
      @url = artist_json["url"]
    end
  end
end
