require "application_system_test_case"

class UserProfilesTest < ApplicationSystemTestCase
  setup do
    @user_profile = user_profiles(:one)
  end

  test "visiting the index" do
    visit user_profiles_url
    assert_selector "h1", text: "User Profiles"
  end

  test "creating a User profile" do
    visit user_profiles_url
    click_on "New User Profile"

    fill_in "Address", with: @user_profile.address
    fill_in "First Name", with: @user_profile.first_name
    fill_in "Last Name", with: @user_profile.last_name
    fill_in "Postal Code", with: @user_profile.postal_code
    fill_in "Pref Code", with: @user_profile.pref_code
    fill_in "Self Introduction", with: @user_profile.self_introduction
    fill_in "User", with: @user_profile.user_id
    click_on "Create User profile"

    assert_text "User profile was successfully created"
    click_on "Back"
  end

  test "updating a User profile" do
    visit user_profiles_url
    click_on "Edit", match: :first

    fill_in "Address", with: @user_profile.address
    fill_in "First Name", with: @user_profile.first_name
    fill_in "Last Name", with: @user_profile.last_name
    fill_in "Postal Code", with: @user_profile.postal_code
    fill_in "Pref Code", with: @user_profile.pref_code
    fill_in "Self Introduction", with: @user_profile.self_introduction
    fill_in "User", with: @user_profile.user_id
    click_on "Update User profile"

    assert_text "User profile was successfully updated"
    click_on "Back"
  end

  test "destroying a User profile" do
    visit user_profiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User profile was successfully destroyed"
  end
end
