dir = File.dirname(File.expand_path(__FILE__))
$LOAD_PATH.unshift dir + '/../lib'
$TESTING = true

require 'rubygems'
require 'test/unit'
require 'restet'

module Restet
  class TestCase < Test::Unit::TestCase
  end
end