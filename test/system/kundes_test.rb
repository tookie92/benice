require "application_system_test_case"

class KundesTest < ApplicationSystemTestCase
  setup do
    @kunde = kundes(:one)
  end

  test "visiting the index" do
    visit kundes_url
    assert_selector "h1", text: "Kundes"
  end

  test "creating a Kunde" do
    visit kundes_url
    click_on "New Kunde"

    fill_in "Ansprechpartner", with: @kunde.ansprechpartner
    fill_in "Email", with: @kunde.email
    fill_in "Name", with: @kunde.name
    fill_in "Telefon", with: @kunde.telefon
    fill_in "Url", with: @kunde.url
    click_on "Create Kunde"

    assert_text "Kunde was successfully created"
    click_on "Back"
  end

  test "updating a Kunde" do
    visit kundes_url
    click_on "Edit", match: :first

    fill_in "Ansprechpartner", with: @kunde.ansprechpartner
    fill_in "Email", with: @kunde.email
    fill_in "Name", with: @kunde.name
    fill_in "Telefon", with: @kunde.telefon
    fill_in "Url", with: @kunde.url
    click_on "Update Kunde"

    assert_text "Kunde was successfully updated"
    click_on "Back"
  end

  test "destroying a Kunde" do
    visit kundes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Kunde was successfully destroyed"
  end
end
