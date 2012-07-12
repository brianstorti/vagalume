#encoding: utf-8

require "spec_helper"

describe Vagalume::LyricFormatter do
  before(:each) do
    VCR.use_cassette('vagalume') do
      @search = Vagalume.find("Metallica", "The Unforgiven")
    end
  end

  it "should format song without translation" do
    options = {:translation => false}
    formatted_lyric = Vagalume::LyricFormatter.format(@search, options)
    lyric = File.read 'spec/assets/lyric_formatter/unforgiven_lyric.txt'
    formatted_lyric.should == lyric
  end

  it "should format song with translation" do
    options = {:translation => true}
    formatted_lyric = Vagalume::LyricFormatter.format(@search, options)
    lyric = File.read 'spec/assets/lyric_formatter/unforgiven_lyric_with_translation.txt'
    formatted_lyric.should == lyric
  end
end
