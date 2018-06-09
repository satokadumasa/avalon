require 'test_helper'

class BookemarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bookemark = bookemarks(:one)
  end

  test "should get index" do
    get bookemarks_url
    assert_response :success
  end

  test "should get new" do
    get new_bookemark_url
    assert_response :success
  end

  test "should create bookemark" do
    assert_difference('Bookemark.count') do
      post bookemarks_url, params: { bookemark: { note_id: @bookemark.note_id, user_id: @bookemark.user_id } }
    end

    assert_redirected_to bookemark_url(Bookemark.last)
  end

  test "should show bookemark" do
    get bookemark_url(@bookemark)
    assert_response :success
  end

  test "should get edit" do
    get edit_bookemark_url(@bookemark)
    assert_response :success
  end

  test "should update bookemark" do
    patch bookemark_url(@bookemark), params: { bookemark: { note_id: @bookemark.note_id, user_id: @bookemark.user_id } }
    assert_redirected_to bookemark_url(@bookemark)
  end

  test "should destroy bookemark" do
    assert_difference('Bookemark.count', -1) do
      delete bookemark_url(@bookemark)
    end

    assert_redirected_to bookemarks_url
  end
end
