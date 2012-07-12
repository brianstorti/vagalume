module Vagalume
  class Song
    attr_accessor :id, :name, :language, :url, :lyric

    def self.fetch(song_json)
      song = Vagalume::Song.new
      song.id = song_json["id"]
      song.language = song_json["lang"]
      song.url = song_json["url"]
      song.lyric = song_json["text"]
      song.name = song_json["name"]
      if song.translation?
        song.name = get_name_from_lyric(song.lyric)
        song.lyric = remove_title(song.lyric)
      end
      song
    end

    def translation?
      @name.nil?
    end

    private

    def self.get_name_from_lyric(lyric)
      title = lyric.lines.first
      title.gsub(/\[|\]|\n/, "")
    end

    # This is necessary because on translations, the song title comes with the
    # lyric text, so we need to remove the first two lines, in order to
    # have a consistent API with the song object
    def self.remove_title(lyric)
      lyric_lines_array = lyric.lines.to_a
      lyric_lines_array.shift(2)
      lyric = ""
      lyric_lines_array.each { |line| lyric << line }
      lyric
    end
  end
end
