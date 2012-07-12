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
```

You can also use it from the command line: 
```console
vagalume Metallica - The Unforgiven
```
or passing the [-t] flag, to show the portuguese translation:
```console
vagalume -t Metallica - The Unforgiven
```


## License

Copyright (c) 2012 Brian Thomas Storti

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
