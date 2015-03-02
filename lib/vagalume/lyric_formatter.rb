module Vagalume
  class LyricFormatter
    def format(search, options)
      return "No lyric found" if search.not_found?

      original_song = search.song

      if options[:translation]
        translated_song = search.translations.with_language(Vagalume::Language::PORTUGUESE)
        return "No translation found" if translated_song.nil?
        return formatted_song_with_transaction(original_song, translated_song)
      end

      "\n\n#{original_song.name}\n\n#{original_song.lyric}"
    end

    private

    def formatted_song_with_transaction(song, translated_song)
      original_lyrics_lines = [song.name, ""] + song.lyric.split("\n")
      translated_lyrics_lines = [translated_song.name, ""] + translated_song.lyric.split("\n")

      biggest_line_size = biggest_line_size(song.lyric)
      formatted_output = "\n\n"

      original_lyrics_lines.each_with_index do |original_line, index|
        separator = find_separator(biggest_line_size, original_line)
        translated_line = translated_lyrics_lines[index]
        formatted_output += original_line + separator + translated_line.to_s + "\n"
      end

      formatted_output
    end

    def find_separator(biggest_line_size, lyric_line)
      " " * (biggest_line_size - lyric_line.size) + "     |     "
    end

    def biggest_line_size(lyric)
      lyric.each_line.max { |a, b| a.length <=> b.length }.size
    end
  end
end
