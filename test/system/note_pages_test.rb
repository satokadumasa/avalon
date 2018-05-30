require "application_system_test_case"

class NotePagesTest < ApplicationSystemTestCase
  setup do
    @note_page = note_pages(:one)
  end

  test "visiting the index" do
    visit note_pages_url
    assert_selector "h1", text: "Note Pages"
  end

  test "creating a Note page" do
    visit note_pages_url
    click_on "New Note Page"

    fill_in "Note", with: @note_page.note_id
    fill_in "Page", with: @note_page.page_id
    click_on "Create Note page"

    assert_text "Note page was successfully created"
    click_on "Back"
  end

  test "updating a Note page" do
    visit note_pages_url
    click_on "Edit", match: :first

    fill_in "Note", with: @note_page.note_id
    fill_in "Page", with: @note_page.page_id
    click_on "Update Note page"

    assert_text "Note page was successfully updated"
    click_on "Back"
  end

  test "destroying a Note page" do
    visit note_pages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Note page was successfully destroyed"
  end
end
