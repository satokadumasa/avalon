require "application_system_test_case"

class UserPagesTest < ApplicationSystemTestCase
  setup do
    @user_page = user_pages(:one)
  end

  test "visiting the index" do
    visit user_pages_url
    assert_selector "h1", text: "User Pages"
  end

  test "creating a User page" do
    visit user_pages_url
    click_on "New User Page"

    fill_in "Page", with: @user_page.page_id
    fill_in "User", with: @user_page.user_id
    click_on "Create User page"

    assert_text "User page was successfully created"
    click_on "Back"
  end

  test "updating a User page" do
    visit user_pages_url
    click_on "Edit", match: :first

    fill_in "Page", with: @user_page.page_id
    fill_in "User", with: @user_page.user_id
    click_on "Update User page"

    assert_text "User page was successfully updated"
    click_on "Back"
  end

  test "destroying a User page" do
    visit user_pages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User page was successfully destroyed"
  end
end
