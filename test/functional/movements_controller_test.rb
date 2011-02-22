require 'test_helper'

class MovementsControllerTest < ActionController::TestCase
  def setup
    @account = Account.new
    @account.name = "Big Jack"
    @account.save
  end

  def teardown
    @account.destroy
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movement" do
    assert_difference('Movement.count') do
      post :create, :movement => { :value=>3, :concept=>"Anything goes", :account=>@account}
    end

    assert_redirected_to movement_path(assigns(:movement))
  end

  test "should show movement" do
    get :show, :id => movements(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => movements(:one).to_param
    assert_response :success
  end

  test "should update movement" do
    put :update, :id => movements(:one).to_param, :movement => { :value=>27, :concept=>"War Machine", :account=>@account}
    assert_redirected_to movement_path(assigns(:movement))
  end

  test "should destroy movement" do
    assert_difference('Movement.count', -1) do
      delete :destroy, :id => movements(:one).to_param
    end

    assert_redirected_to movements_path
  end
end
