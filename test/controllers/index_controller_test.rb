require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get homepage" do
    get index_homepage_url
    assert_response :success
  end

end
