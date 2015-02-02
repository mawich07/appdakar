require 'test_helper'

class AdministradorControllerTest < ActionController::TestCase
  test "should get indes" do
    get :indes
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
