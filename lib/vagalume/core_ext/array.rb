class Array
  def with_language(language)
    select { |song| song.language == language }.first
  end
end

