class Array
  def with_language(language)
    detect { |song| song.language == language }
  end
end

