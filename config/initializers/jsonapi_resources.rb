JSONAPI.configure do |config|
  config.default_paginator = :offset
  config.default_page_size = 25
  config.maximum_page_size = 50
  config.json_key_format = :underscored_key
  config.route_format = :underscored_key
  config.top_level_meta_include_record_count = true
  config.top_level_meta_record_count_key = :record_count
end
