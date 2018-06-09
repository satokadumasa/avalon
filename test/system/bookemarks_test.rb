require "application_system_test_case"

class BookemarksTest < ApplicationSystemTestCase
  setup do
    @bookemark = bookemarks(:one)
  end

  test "visiting the index" do
    visit bookemarks_url
    assert_selector "h1", text: "Bookemarks"
  end

  test "creating a Bookemark" do
    visit bookemarks_url
    click_on "New Bookemark"

    fill_in "Note", with: @bookemark.note_id
    fill_in "User", with: @bookemark.user_id
    click_on "Create Bookemark"

    assert_text "Bookemark was successfully created"
    click_on "Back"
  end

  test "updating a Bookemark" do
    visit bookemarks_url
    click_on "Edit", match: :first

    fill_in "Note", with: @bookemark.note_id
    fill_in "User", with: @bookemark.user_id
    click_on "Update Bookemark"

    assert_text "Bookemark was successfully updated"
    click_on "Back"
  end

  test "destroying a Bookemark" do
    visit bookemarks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bookemark was successfully destroyed"
  end
end
