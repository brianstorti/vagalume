module Vagalume
  class LyricFormatter
    def format(search, options)
      return "No lyric found" if search.not_found?

      song = search.song
      translated_song = search.translations.with_language(Vagalume::Language::PORTUGUESE)
      output = "\n\n"

      return "\n\n#{song.name}\n\n#{song.lyric}" unless options[:translation]
      return "No translation found" if translated_song.nil?

      bigger_line = bigger_line(song.lyric)
      lyric_array = [song.name, ""]
      translation_array = [translated_song.name, ""]

      lyric_array += song.lyric.split("\n")
      translation_array += translated_song.lyric.split("\n")

      lyric_array.each_with_index do |lyric_line, index|
        output += lyric_line + separator(bigger_line, lyric_line) + translation_array[index].to_s + "\n"
      end
      output
    end

    private

    def separator(bigger_line, lyric_line)
      " " * (bigger_line - lyric_line.size) + "     |     "
    end

    def bigger_line(lyric)
      bigger = 0
      lyric.each_line do |line|
        bigger = line.size if line.size > bigger
      end
      bigger
    end
  end
end
