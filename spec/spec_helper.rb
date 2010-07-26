$:.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require 'rspec'
# optionally add autorun support
require 'rspec/autorun'

Rspec.configure do |c|
  c.mock_with :rspec
end

require 'mongo_backer'