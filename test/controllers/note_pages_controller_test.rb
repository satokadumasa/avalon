require 'test_helper'

class NotePagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @note_page = note_pages(:one)
  end

  test "should get index" do
    get note_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_note_page_url
    assert_response :success
  end

  test "should create note_page" do
    assert_difference('NotePage.count') do
      post note_pages_url, params: { note_page: { note_id: @note_page.note_id, page_id: @note_page.page_id } }
    end

    assert_redirected_to note_page_url(NotePage.last)
  end

  test "should show note_page" do
    get note_page_url(@note_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_note_page_url(@note_page)
    assert_response :success
  end

  test "should update note_page" do
    patch note_page_url(@note_page), params: { note_page: { note_id: @note_page.note_id, page_id: @note_page.page_id } }
    assert_redirected_to note_page_url(@note_page)
  end

  test "should destroy note_page" do
    assert_difference('NotePage.count', -1) do
      delete note_page_url(@note_page)
    end

    assert_redirected_to note_pages_url
  end
end
