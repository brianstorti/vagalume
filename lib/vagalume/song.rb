module Vagalume
  class Song
    attr_accessor :id, :name, :language, :url, :lyric

    def initialize(song)
      @id = song["id"]
      @language = song["lang"]
      @url = song["url"]
      @lyric = song["text"]
      @name = song["name"]

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

    # This is necessary because, for translations, the song title comes with the
    # lyric text. Also, the format is not always the same, sometimes it's just one line
    # for the title, sometimes it's the title followed by some empty lines.
    # Here we remove the first line and any following empty lines, so we have
    # a consident API.
    def remove_title(lyric)
      lines = lyric.lines
      lines.shift
      lines = remove_empty_lines_from_beginning(lines)
      lines.join
    end

    def remove_empty_lines_from_beginning(lines)
      return lines unless lines.first.empty? || lines.first == "\n"

      lines.shift
      remove_empty_lines_from_beginning(lines)
    end
  end
end
