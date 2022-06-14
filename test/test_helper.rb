# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'

require 'coveralls'

if ENV['CI']
  require 'coveralls'
  Coveralls.wear!
end
