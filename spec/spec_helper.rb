require 'bundler/setup'
require 'dotenv'
require 'vcr'

$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'bill_nye_renamer'

Dotenv.load

if tvdb_api_key = ENV['TVDB_API_KEY']
  BillNyeRenamer.tvdb_api_key = tvdb_api_key
else
  $stderr.puts 'Error: You must set TVDB_API_KEY in your environment'
  exit 1
end

VCR.configure do |config|
  config.cassette_library_dir = File.join(File.dirname(__FILE__), 'cassettes')
  config.hook_into :webmock
end
