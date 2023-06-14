require "test_helper"

class PirschApiTokenTest < Minitest::Test
  def test_request_body
    api = PirschApi::Token.new("foo", "bar")
    assert_equal api.request_body,
      {"client_id" => "foo", "client_secret" => "bar"}.to_json
  end
end
