require "test_helper"

class PirschApiTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::PirschApi::VERSION
  end
end
