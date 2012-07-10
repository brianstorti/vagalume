## Vagalume

A simple ruby interface to the Vagalume API

## Install

You can add it to your Gemfile with:
```ruby
gem 'vagalume'
```
and run the bundle command to install it.

For non-Rails projects, you can simply install the gem with
```console
gem install 'vagalume'
```

## Usage

The usage of the vagalume gem is pretty simple:

```ruby
require "vagalume"

result = Vagalume.find("Metallica", "The Unforgiven")

puts result.status # Can be "exact", "aprox", "song_notfound" or "notfound"

puts result.song.id
puts result.song.name
puts result.song.language
puts result.song.url
puts result.song.lyric

puts result.artist.id
puts result.artist.name
puts result.artist.url

puts result.translations.with_language(Vagalume::Language::PORTUGUESE) # return a Song object
````

## Copyright

Copyright (c) 2012 Brian Thomas Storti. See LICENSE.txt for
further details.



