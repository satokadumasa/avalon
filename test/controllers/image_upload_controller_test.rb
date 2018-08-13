require 'test_helper'

class ImageUploadControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get image_upload_create_url
    assert_response :success
  end

end
