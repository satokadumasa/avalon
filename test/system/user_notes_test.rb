require "application_system_test_case"

class UserNotesTest < ApplicationSystemTestCase
  setup do
    @user_note = user_notes(:one)
  end

  test "visiting the index" do
    visit user_notes_url
    assert_selector "h1", text: "User Notes"
  end

  test "creating a User note" do
    visit user_notes_url
    click_on "New User Note"

    fill_in "Note", with: @user_note.note_id
    fill_in "User", with: @user_note.user_id
    click_on "Create User note"

    assert_text "User note was successfully created"
    click_on "Back"
  end

  test "updating a User note" do
    visit user_notes_url
    click_on "Edit", match: :first

    fill_in "Note", with: @user_note.note_id
    fill_in "User", with: @user_note.user_id
    click_on "Update User note"

    assert_text "User note was successfully updated"
    click_on "Back"
  end

  test "destroying a User note" do
    visit user_notes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User note was successfully destroyed"
  end
end
