require 'simplecov'
SimpleCov.start

require 'pry'
require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.configure do |config|
  config.formatter = :documentation
end
