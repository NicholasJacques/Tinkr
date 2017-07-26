VCR.configure do |config|
  config.cassette_library_dir = 'spec/support/cassettes'
  config.ignore_localhost = true
  config.allow_http_connections_when_no_cassette = true
  config.hook_into :webmock
end
