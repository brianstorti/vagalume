module Vagalume
  class Song
    attr_accessor :id, :name, :language, :url, :lyric

    def initialize(song_json)
      @id = song_json["id"]
      @language = song_json["lang"]
      @url = song_json["url"]
      @lyric = song_json["text"]
      @name = song_json["name"]

      if translation?
        @name = get_name_from_lyric(@lyric)
        @lyric = remove_title(@lyric)
      end
    end

    def translation?
      @name.nil?
    end

    private

    def get_name_from_lyric(lyric)
      title = lyric.lines.first
      title.gsub(/\[|\]|\n/, "")
    end

    # This is necessary because on translations, the song title comes with the
    # lyric text, so we need to remove the first two lines, in order to
    # have a consistent API with the song object
    def remove_title(lyric)
      lines = lyric.lines.to_a
      lines.shift(2)
      lines.join
    end
  end
end
