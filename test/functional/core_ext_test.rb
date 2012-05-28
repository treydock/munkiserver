require 'test_helper'
 
class CoreExtTest < Test::Unit::TestCase
  def test_to_bool_returns_true
    assert_equal true, "true".to_bool
  end
  
  def test_to_bool_returns_false
    assert_equal false, "false".to_bool
  end
end