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

  BASE_URL = "http://www.vagalume.com.br/api/search.php?"

  def find(artist, song)
    request_url = BASE_URL + "art=#{CGI.escape(artist)}&mus=#{CGI.escape(song)}"
    result_json = MultiJson.decode(open(request_url).read)
    search_result = Vagalume::SearchResult.new(result_json)
  end

  def get_lyric(artist, song, options)
    search = find(artist, song)
    Vagalume::LyricFormatter.format(search, options)
  end
end
