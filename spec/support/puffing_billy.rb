Billy.configure do |c|
  c.cache = true
  c.persist_cache = true
  c.cache_path = 'spec/support/bill_cache/'
  c.path_blacklist = ['/api/v1/vin_search']
end

Billy.proxy.reset_cache