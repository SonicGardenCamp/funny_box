require "test_helper"

class CapsuleToysControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get capsule_toys_show_url
    assert_response :success
  end
end
