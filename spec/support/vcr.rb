VCR.configure do |config|
  config.cassette_library_dir = 'spec/support/cassettes'
  config.hook_into :webmock
  config.ignore_localhost = false
  config.allow_http_connections_when_no_cassette = true
end