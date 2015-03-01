module Vagalume
  class LyricFormatter
    def format(search, options)
      return "No lyric found" if search.not_found?

      song = search.song
      translated_song = search.translations.with_language(Vagalume::Language::PORTUGUESE)

      return "\n\n#{song.name}\n\n#{song.lyric}" unless options[:translation]
      return "No translation found" if translated_song.nil?

      original_lyrics_lines = [song.name, ""]
      translated_lyrics_lines = [translated_song.name, ""]

      original_lyrics_lines += song.lyric.split("\n")
      translated_lyrics_lines += translated_song.lyric.split("\n")

      biggest_line_size = biggest_line_size(song.lyric)
      output = "\n\n"

      original_lyrics_lines.each_with_index do |original_line, index|
        separator = find_separator(biggest_line_size, original_line)
        translated_line = translated_lyrics_lines[index]
        output += original_line + separator + translated_line + "\n"
      end

      output
    end

    private

    def find_separator(biggest_line_size, lyric_line)
      " " * (biggest_line_size - lyric_line.size) + "     |     "
    end

    def biggest_line_size(lyric)
      lyric.each_line.max { |a, b| a.length <=> b.length }.size
    end
  end
end
