class Array
  def with_language(language)
    self.each do |song| 
      return song if song.language == language
    end
    nil
  end
end

