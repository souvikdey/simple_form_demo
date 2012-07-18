require 'test_helper'

class RolesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Roles.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Roles.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to roles_url(assigns(:roles))
  end

  def test_show
    get :show, :id => Roles.first
    assert_template 'show'
  end
end
