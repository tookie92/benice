require 'test_helper'

class KundesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kunde = kundes(:one)
  end

  test "should get index" do
    get kundes_url
    assert_response :success
  end

  test "should get new" do
    get new_kunde_url
    assert_response :success
  end

  test "should create kunde" do
    assert_difference('Kunde.count') do
      post kundes_url, params: { kunde: { ansprechpartner: @kunde.ansprechpartner, email: @kunde.email, name: @kunde.name, telefon: @kunde.telefon, url: @kunde.url } }
    end

    assert_redirected_to kunde_url(Kunde.last)
  end

  test "should show kunde" do
    get kunde_url(@kunde)
    assert_response :success
  end

  test "should get edit" do
    get edit_kunde_url(@kunde)
    assert_response :success
  end

  test "should update kunde" do
    patch kunde_url(@kunde), params: { kunde: { ansprechpartner: @kunde.ansprechpartner, email: @kunde.email, name: @kunde.name, telefon: @kunde.telefon, url: @kunde.url } }
    assert_redirected_to kunde_url(@kunde)
  end

  test "should destroy kunde" do
    assert_difference('Kunde.count', -1) do
      delete kunde_url(@kunde)
    end

    assert_redirected_to kundes_url
  end
end
