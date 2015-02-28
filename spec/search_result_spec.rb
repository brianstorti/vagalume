#encoding: utf-8

require "spec_helper"

describe Vagalume::SearchResult do
  it 'knows the song was not found when the status is NOT_FOUND' do
    result = { "type" => Vagalume::Status::NOT_FOUND }
    search_result = Vagalume::SearchResult.new(result)
    search_result.not_found?.should be_true
  end

  it 'knows the song was not found when the status is SONG_NOT_FOUND' do
    result = { "type" => Vagalume::Status::SONG_NOT_FOUND }
    search_result = Vagalume::SearchResult.new(result)
    search_result.not_found?.should be_true
  end
end
