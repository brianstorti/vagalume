#encoding: utf-8

require "spec_helper"

describe Vagalume do

  before(:each) do
    VCR.use_cassette('vagalume') do
      @result = Vagalume.find("Metallica", "The Unforgiven")
    end
  end

  it "should bring song" do
    song = @result.song
    artist = @result.artist
    lyric = File.read 'spec/assets/unforgiven_lyric.txt'

    @result.status.should == Vagalume::Status::EXACT

    song.id.should == "3ade68b6g470deda3"
    song.name.should == "The Unforgiven"
    song.language.should == Vagalume::Language::ENGLISH
    song.url.should == "http://www.vagalume.com.br/metallica/the-unforgiven.html"
    song.lyric.should == lyric.chop!

    artist.id.should == "3ade68b5g7257eda3"
    artist.name.should == "Metallica"
    artist.url.should == "http://www.vagalume.com.br/metallica/"
  end

  it "should return result with song not found status" do
    VCR.use_cassette('vagalume_song_not_found') do
      result = Vagalume.find("Metallica", "Oops")
      result.status.should == Vagalume::Status::SONG_NOT_FOUND
    end
  end

  it "should return result with not found status" do
    VCR.use_cassette('vagalume_not_found') do
      result = Vagalume.find("Oops", "Oops")
      result.status.should == Vagalume::Status::NOT_FOUND
    end
  end

  it "should have translations" do
    @result.translations.should_not be_empty
    pt_translation = @result.translations.with_language(Vagalume::Language::PORTUGUESE)
    lyric = File.read 'spec/assets/unforgiven_lyric_translation_pt.txt'
    pt_translation.lyric.should == lyric.chop!
  end

  it "should get right song name for translations" do
    translated_song = @result.translations.with_language(Vagalume::Language::PORTUGUESE)
    translated_song.name.should == "Os Imperdoáveis"
  end
end
