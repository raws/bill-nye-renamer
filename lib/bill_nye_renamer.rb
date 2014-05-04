require 'bundler/setup'
require 'tvdbr'

require 'bill_nye_renamer/episode'

module BillNyeRenamer
  class << self
    attr_accessor :tvdb_api_key
  end
end
