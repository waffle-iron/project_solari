require 'test_helper'

class MatchingsControllerTest < ActionController::TestCase
  setup do
    @matching = matchings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matchings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create matching" do
    assert_difference('Matching.count') do
      post :create, matching: { bronze: @matching.bronze, challenger: @matching.challenger, deadline: @matching.deadline, diamond: @matching.diamond, gold: @matching.gold, master: @matching.master, plutinum: @matching.plutinum, queue_type: @matching.queue_type, silver: @matching.silver, under30: @matching.under30, unranked: @matching.unranked }
    end

    assert_redirected_to matching_path(assigns(:matching))
  end

  test "should show matching" do
    get :show, id: @matching
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @matching
    assert_response :success
  end

  test "should update matching" do
    patch :update, id: @matching, matching: { bronze: @matching.bronze, challenger: @matching.challenger, deadline: @matching.deadline, diamond: @matching.diamond, gold: @matching.gold, master: @matching.master, plutinum: @matching.plutinum, queue_type: @matching.queue_type, silver: @matching.silver, under30: @matching.under30, unranked: @matching.unranked }
    assert_redirected_to matching_path(assigns(:matching))
  end

  test "should destroy matching" do
    assert_difference('Matching.count', -1) do
      delete :destroy, id: @matching
    end

    assert_redirected_to matchings_path
  end
end
