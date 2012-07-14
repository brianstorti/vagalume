module Vagalume
  class SearchResult
    attr_accessor :status, :artist, :song, :translations

    def initialize
      @translations = []
    end

    def self.fetch(result_json)
      result = Vagalume::SearchResult.new
      result.status = result_json["type"]
      return result if result.status == Vagalume::Status::NOT_FOUND || result.status == Vagalume::Status::SONG_NOT_FOUND
      song = result_json["mus"].first
      artist = result_json["art"]
      translations = song["translate"] || []
      result.song = Vagalume::Song.fetch(song)
      result.artist = Vagalume::Artist.fetch(artist)

      translations.each do |translation|
        result.translations << Vagalume::Song.fetch(translation)
      end
      result
    end
  end
end
