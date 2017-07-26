Billy.configure do |c|
  c.cache = true
  c.persist_cache = true
  c.cache_path = 'spec/support/bill_cache/'
end

Billy.proxy.reset_cache