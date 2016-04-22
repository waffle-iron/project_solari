require 'faraday'
require 'typhoeus'
require 'typhoeus/adapters/faraday'

Taric.configure! do |config|
  config.api_key = Rails.application.secrets.riot_api_key
  config.adapter = :typhoeus # default is Faraday.default_adapter
end
