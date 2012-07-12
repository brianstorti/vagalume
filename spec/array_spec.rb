#encoding: utf-8

require "spec_helper"

describe Array do
  it "return song with selected language" do
    right_song = double "Song"
    right_song.stub!(:language).and_return(Vagalume::Language::PORTUGUESE)

    wrong_song = double "Song"
    wrong_song.stub!(:language).and_return(Vagalume::Language::ENGLISH)

    songs = [right_song, wrong_song]
    songs.with_language(Vagalume::Language::PORTUGUESE).should == right_song
  end
end
