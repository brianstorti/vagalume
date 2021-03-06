require "multi_json"
require "cgi"
require "open-uri"
require_relative "vagalume/core_ext/array"
require_relative "vagalume/search_result"
require_relative "vagalume/language"
require_relative "vagalume/song"
require_relative "vagalume/artist"
require_relative "vagalume/lyric_formatter"
require_relative "vagalume/status"

module Vagalume
  extend self

  BASE_URL = "http://api.vagalume.com.br/search.php?"

  def find(artist, song)
    request_url = BASE_URL + "art=#{CGI.escape(artist)}&mus=#{CGI.escape(song)}"
    result = MultiJson.decode(open(request_url).read)
    search_result = Vagalume::SearchResult.new(result)
  end

  def get_lyric(artist, song, options)
    search = find(artist, song)
    formatter = Vagalume::LyricFormatter.new
    formatter.format(search, options)
  end
end
