require "application_system_test_case"

class PagecommentsTest < ApplicationSystemTestCase
  setup do
    @pagecomment = pagecomments(:one)
  end

  test "visiting the index" do
    visit pagecomments_url
    assert_selector "h1", text: "Pagecomments"
  end

  test "creating a Pagecomment" do
    visit pagecomments_url
    click_on "New Pagecomment"

    fill_in "Detail", with: @pagecomment.detail
    fill_in "Title", with: @pagecomment.title
    click_on "Create Pagecomment"

    assert_text "Pagecomment was successfully created"
    click_on "Back"
  end

  test "updating a Pagecomment" do
    visit pagecomments_url
    click_on "Edit", match: :first

    fill_in "Detail", with: @pagecomment.detail
    fill_in "Title", with: @pagecomment.title
    click_on "Update Pagecomment"

    assert_text "Pagecomment was successfully updated"
    click_on "Back"
  end

  test "destroying a Pagecomment" do
    visit pagecomments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pagecomment was successfully destroyed"
  end
end
