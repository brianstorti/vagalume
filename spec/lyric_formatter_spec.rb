#encoding: utf-8

require "spec_helper"

describe Vagalume::LyricFormatter do
  context "there is a translation available" do
    before(:each) do
      VCR.use_cassette('vagalume') do
        @search = Vagalume.find("Metallica", "The Unforgiven")
      end
    end

    it "should format song without translation option" do
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

  context "there is no translation available" do
    it "should inform user there is no translation available" do
      VCR.use_cassette('vagalume_with_no_translation_available') do
        @search = Vagalume.find("Bruce Springsteen", "Ain't good enough for You")
        options = {:translation => true}
        output = Vagalume::LyricFormatter.format(@search, options)
        output.should == "No translation found"
      end
    end
  end
end
