require "rspec"
require "vcr"
require_relative "../lib/vagalume"

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
end
