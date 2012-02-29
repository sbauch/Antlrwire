require 'test_helper'

class FanPagesControllerTest < ActionController::TestCase
  setup do
    @fan_page = fan_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fan_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fan_page" do
    assert_difference('FanPage.count') do
      post :create, fan_page: @fan_page.attributes
    end

    assert_redirected_to fan_page_path(assigns(:fan_page))
  end

  test "should show fan_page" do
    get :show, id: @fan_page.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fan_page.to_param
    assert_response :success
  end

  test "should update fan_page" do
    put :update, id: @fan_page.to_param, fan_page: @fan_page.attributes
    assert_redirected_to fan_page_path(assigns(:fan_page))
  end

  test "should destroy fan_page" do
    assert_difference('FanPage.count', -1) do
      delete :destroy, id: @fan_page.to_param
    end

    assert_redirected_to fan_pages_path
  end
end
