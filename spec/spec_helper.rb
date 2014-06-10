require 'griddler/testing'
require 'griddler/mailgun'
require 'action_dispatch'
require 'active_support/core_ext/string'
require 'active_support/core_ext/hash'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.order = 'random'
  config.include Griddler::Testing
end
