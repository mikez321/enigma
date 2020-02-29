require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/compiler'

class CompilerTest < Minitest::Test

  def setup
    @compiler = Compiler.new
  end

  def test_it_exists
    assert_instance_of Compiler, @compiler
  end
end
