module Vagalume
  class SearchResult
    attr_accessor :status, :artist, :song, :translations

    def initialize(result)
      @translations = []
      @status = result["type"]
      return if @status == Vagalume::Status::NOT_FOUND ||
                @status == Vagalume::Status::SONG_NOT_FOUND

      song = result["mus"].first
      artist = result["art"]
      translations = song["translate"] || []
      @song = Vagalume::Song.fetch(song)
      @artist = Vagalume::Artist.fetch(artist)

      translations.each do |translation|
        @translations << Vagalume::Song.fetch(translation)
      end
    end
  end
end
