require 'test_helper'

class PagecommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pagecomment = pagecomments(:one)
  end

  test "should get index" do
    get pagecomments_url
    assert_response :success
  end

  test "should get new" do
    get new_pagecomment_url
    assert_response :success
  end

  test "should create pagecomment" do
    assert_difference('Pagecomment.count') do
      post pagecomments_url, params: { pagecomment: { detail: @pagecomment.detail, title: @pagecomment.title } }
    end

    assert_redirected_to pagecomment_url(Pagecomment.last)
  end

  test "should show pagecomment" do
    get pagecomment_url(@pagecomment)
    assert_response :success
  end

  test "should get edit" do
    get edit_pagecomment_url(@pagecomment)
    assert_response :success
  end

  test "should update pagecomment" do
    patch pagecomment_url(@pagecomment), params: { pagecomment: { detail: @pagecomment.detail, title: @pagecomment.title } }
    assert_redirected_to pagecomment_url(@pagecomment)
  end

  test "should destroy pagecomment" do
    assert_difference('Pagecomment.count', -1) do
      delete pagecomment_url(@pagecomment)
    end

    assert_redirected_to pagecomments_url
  end
end
