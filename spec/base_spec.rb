#encoding: utf-8

require "spec_helper"

describe Vagalume do

  before do
    VCR.use_cassette('vagalume') do
      @result = Vagalume.find("Metallica", "The Unforgiven")
    end
  end

  it "returns parsed result" do
    @result.status.should == Vagalume::Status::EXACT

    @result.song.id.should == "3ade68b6g470deda3"
    @result.song.name.should == "The Unforgiven"
    @result.song.language.should == Vagalume::Language::ENGLISH
    @result.song.url.should == "http://www.vagalume.com.br/metallica/the-unforgiven.html"
    @result.song.lyric.should == File.read('spec/assets/unforgiven_lyric.txt').chop

    @result.artist.id.should == "3ade68b5g7257eda3"
    @result.artist.name.should == "Metallica"
    @result.artist.url.should == "http://www.vagalume.com.br/metallica/"
  end

  it "returns result with song not found status" do
    VCR.use_cassette('vagalume_song_not_found') do
      result = Vagalume.find("Metallica", "Oops")
      result.status.should == Vagalume::Status::SONG_NOT_FOUND
    end
  end

  it "returns result with not found status" do
    VCR.use_cassette('vagalume_not_found') do
      result = Vagalume.find("Oops", "Oops")
      result.status.should == Vagalume::Status::NOT_FOUND
    end
  end

  it "has translations" do
    @result.translations.should_not be_empty
    pt_translation = @result.translations.with_language(Vagalume::Language::PORTUGUESE)
    lyric = File.read 'spec/assets/unforgiven_lyric_translation_pt.txt'
    pt_translation.lyric.should == lyric.chop!
  end

  it "gets the right song name for translations" do
    translated_song = @result.translations.with_language(Vagalume::Language::PORTUGUESE)
    translated_song.name.should == "Os Imperdoáveis"
  end
end
