require 'test_helper'

class UserNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_note = user_notes(:one)
  end

  test "should get index" do
    get user_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_user_note_url
    assert_response :success
  end

  test "should create user_note" do
    assert_difference('UserNote.count') do
      post user_notes_url, params: { user_note: { note_id: @user_note.note_id, user_id: @user_note.user_id } }
    end

    assert_redirected_to user_note_url(UserNote.last)
  end

  test "should show user_note" do
    get user_note_url(@user_note)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_note_url(@user_note)
    assert_response :success
  end

  test "should update user_note" do
    patch user_note_url(@user_note), params: { user_note: { note_id: @user_note.note_id, user_id: @user_note.user_id } }
    assert_redirected_to user_note_url(@user_note)
  end

  test "should destroy user_note" do
    assert_difference('UserNote.count', -1) do
      delete user_note_url(@user_note)
    end

    assert_redirected_to user_notes_url
  end
end
