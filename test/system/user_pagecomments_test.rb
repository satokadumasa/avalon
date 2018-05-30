require "application_system_test_case"

class UserPagecommentsTest < ApplicationSystemTestCase
  setup do
    @user_pagecomment = user_pagecomments(:one)
  end

  test "visiting the index" do
    visit user_pagecomments_url
    assert_selector "h1", text: "User Pagecomments"
  end

  test "creating a User pagecomment" do
    visit user_pagecomments_url
    click_on "New User Pagecomment"

    fill_in "Pagecomment", with: @user_pagecomment.pagecomment_id
    fill_in "User", with: @user_pagecomment.user_id
    click_on "Create User pagecomment"

    assert_text "User pagecomment was successfully created"
    click_on "Back"
  end

  test "updating a User pagecomment" do
    visit user_pagecomments_url
    click_on "Edit", match: :first

    fill_in "Pagecomment", with: @user_pagecomment.pagecomment_id
    fill_in "User", with: @user_pagecomment.user_id
    click_on "Update User pagecomment"

    assert_text "User pagecomment was successfully updated"
    click_on "Back"
  end

  test "destroying a User pagecomment" do
    visit user_pagecomments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User pagecomment was successfully destroyed"
  end
end
