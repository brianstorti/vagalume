#encoding: utf-8

require "spec_helper"

describe Vagalume::Song do
  let(:translation_lyric) do
    "title


    Lyric"
  end

  it "removes the title from the lyrics for translations" do
    params = { "name" => nil, "text" => translation_lyric }
    song = Vagalume::Song.new(params)
    song.lyric.strip.should == "Lyric"
  end

  it "doesn't change the lyrics when it's not a translation" do
    params = { "name" => "Foo", "text" => translation_lyric }
    song = Vagalume::Song.new(params)
    song.lyric.should == translation_lyric
  end
end
