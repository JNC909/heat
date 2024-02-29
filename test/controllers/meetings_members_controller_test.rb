require "test_helper"

class MeetingsMembersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get meetings_members_index_url
    assert_response :success
  end
end
