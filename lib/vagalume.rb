require "multi_json"
require "cgi"
require "open-uri"
require_relative "vagalume/core_ext/array"
require_relative "vagalume/search_result"
require_relative "vagalume/language"
require_relative "vagalume/song"
require_relative "vagalume/artist"
require_relative "vagalume/status"

module Vagalume
  BASE_URL = "http://www.vagalume.com.br/api/search.php?"

  def self.find(artist, song)
    request_url = BASE_URL + "art=#{CGI.escape(artist)}&mus=#{CGI.escape(song)}"
    result_json = MultiJson.decode(open(request_url).read)
    search_result = Vagalume::SearchResult.fetch(result_json)
  end
end
