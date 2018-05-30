require "application_system_test_case"

class PagecommentPagesTest < ApplicationSystemTestCase
  setup do
    @pagecomment_page = pagecomment_pages(:one)
  end

  test "visiting the index" do
    visit pagecomment_pages_url
    assert_selector "h1", text: "Pagecomment Pages"
  end

  test "creating a Pagecomment page" do
    visit pagecomment_pages_url
    click_on "New Pagecomment Page"

    fill_in "Page", with: @pagecomment_page.page_id
    fill_in "Pagecomment", with: @pagecomment_page.pagecomment_id
    click_on "Create Pagecomment page"

    assert_text "Pagecomment page was successfully created"
    click_on "Back"
  end

  test "updating a Pagecomment page" do
    visit pagecomment_pages_url
    click_on "Edit", match: :first

    fill_in "Page", with: @pagecomment_page.page_id
    fill_in "Pagecomment", with: @pagecomment_page.pagecomment_id
    click_on "Update Pagecomment page"

    assert_text "Pagecomment page was successfully updated"
    click_on "Back"
  end

  test "destroying a Pagecomment page" do
    visit pagecomment_pages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pagecomment page was successfully destroyed"
  end
end
