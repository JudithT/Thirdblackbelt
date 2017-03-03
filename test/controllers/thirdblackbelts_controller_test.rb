require 'test_helper'

class ThirdblackbeltsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get thirdblackbelts_index_url
    assert_response :success
  end

end
