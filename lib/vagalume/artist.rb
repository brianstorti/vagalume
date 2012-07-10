module Vagalume
  class Artist
    attr_accessor :id, :name, :url

    def self.fetch(artist_json)
      artist = Vagalume::Artist.new
      artist.id = artist_json["id"]
      artist.name = artist_json["name"] 
      artist.url = artist_json["url"] 
      artist
    end
  end
end
