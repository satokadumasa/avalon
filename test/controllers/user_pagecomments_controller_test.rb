require 'test_helper'

class UserPagecommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_pagecomment = user_pagecomments(:one)
  end

  test "should get index" do
    get user_pagecomments_url
    assert_response :success
  end

  test "should get new" do
    get new_user_pagecomment_url
    assert_response :success
  end

  test "should create user_pagecomment" do
    assert_difference('UserPagecomment.count') do
      post user_pagecomments_url, params: { user_pagecomment: { pagecomment_id: @user_pagecomment.pagecomment_id, user_id: @user_pagecomment.user_id } }
    end

    assert_redirected_to user_pagecomment_url(UserPagecomment.last)
  end

  test "should show user_pagecomment" do
    get user_pagecomment_url(@user_pagecomment)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_pagecomment_url(@user_pagecomment)
    assert_response :success
  end

  test "should update user_pagecomment" do
    patch user_pagecomment_url(@user_pagecomment), params: { user_pagecomment: { pagecomment_id: @user_pagecomment.pagecomment_id, user_id: @user_pagecomment.user_id } }
    assert_redirected_to user_pagecomment_url(@user_pagecomment)
  end

  test "should destroy user_pagecomment" do
    assert_difference('UserPagecomment.count', -1) do
      delete user_pagecomment_url(@user_pagecomment)
    end

    assert_redirected_to user_pagecomments_url
  end
end
