require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get _pages" do
    get home__pages_url
    assert_response :success
  end

end
