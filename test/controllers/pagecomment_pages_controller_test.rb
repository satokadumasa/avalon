require 'test_helper'

class PagecommentPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pagecomment_page = pagecomment_pages(:one)
  end

  test "should get index" do
    get pagecomment_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_pagecomment_page_url
    assert_response :success
  end

  test "should create pagecomment_page" do
    assert_difference('PagecommentPage.count') do
      post pagecomment_pages_url, params: { pagecomment_page: { page_id: @pagecomment_page.page_id, pagecomment_id: @pagecomment_page.pagecomment_id } }
    end

    assert_redirected_to pagecomment_page_url(PagecommentPage.last)
  end

  test "should show pagecomment_page" do
    get pagecomment_page_url(@pagecomment_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_pagecomment_page_url(@pagecomment_page)
    assert_response :success
  end

  test "should update pagecomment_page" do
    patch pagecomment_page_url(@pagecomment_page), params: { pagecomment_page: { page_id: @pagecomment_page.page_id, pagecomment_id: @pagecomment_page.pagecomment_id } }
    assert_redirected_to pagecomment_page_url(@pagecomment_page)
  end

  test "should destroy pagecomment_page" do
    assert_difference('PagecommentPage.count', -1) do
      delete pagecomment_page_url(@pagecomment_page)
    end

    assert_redirected_to pagecomment_pages_url
  end
end
