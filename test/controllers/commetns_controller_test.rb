require 'test_helper'

class CommetnsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get commetns_show_url
    assert_response :success
  end

end
