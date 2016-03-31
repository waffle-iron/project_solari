require 'faraday'
require 'typhoeus'
require 'typhoeus/adapters/faraday'

Taric.configure! do |config|
  config.api_key = '68df2825-ed66-4900-ab5c-159516f64fd1' # marpore private key!
  config.adapter = :typhoeus # default is Faraday.default_adapter
end
