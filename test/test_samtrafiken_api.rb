require 'test/unit'
require 'samtrafiken_api'

class SamtrafikenAPITest < Test::Unit::TestCase
  def test_hello
    assert_equal "Hello world!",
      SamtrafikenAPI.hi()
  end

end
