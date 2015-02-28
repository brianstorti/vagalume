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
      @song = Vagalume::Song.new(song)
      @artist = Vagalume::Artist.new(artist)

      translations.each do |translation|
        @translations << Vagalume::Song.new(translation)
      end
    end
  end
end
