#encoding: utf-8

require "spec_helper"

describe "Command line utility" do
  it "should format song without translation" do
    VCR.use_cassette('vagalume') do
      options = {:translation => false}
      search = Vagalume.find("Metallica", "The Unforgiven")
      formatted_lyric = Vagalume::LyricFormatter.format(search, options)
      lyric = File.read 'spec/assets/unforgiven_lyric.txt'
      formatted_lyric.should == lyric.chop!
    end
  end

  it "should format song with translation" do
    VCR.use_cassette('vagalume') do
      options = {:translation => true}
      search = Vagalume.find("Metallica", "The Unforgiven")
      formatted_lyric = Vagalume::LyricFormatter.format(search, options)
      lyric = File.read 'spec/assets/unforgiven_lyric_with_translation.txt'
      formatted_lyric.should == lyric.chop!
    end
  end
end
