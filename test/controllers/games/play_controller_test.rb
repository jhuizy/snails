require "test_helper"

class Games::PlayControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get games_play_index_url
    assert_response :success
  end
end
