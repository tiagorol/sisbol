require 'test_helper'

class MatchesControllerTest < ActionController::TestCase
  setup do
    @match = matches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create match" do
    assert_difference('Match.count') do
      post :create, match: { away_team: @match.away_team, championship_id: @match.championship_id, goals_away_team: @match.goals_away_team, goals_home_team: @match.goals_home_team, home_team: @match.home_team, round_id: @match.round_id }
    end

    assert_redirected_to match_path(assigns(:match))
  end

  test "should show match" do
    get :show, id: @match
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @match
    assert_response :success
  end

  test "should update match" do
    patch :update, id: @match, match: { away_team: @match.away_team, championship_id: @match.championship_id, goals_away_team: @match.goals_away_team, goals_home_team: @match.goals_home_team, home_team: @match.home_team, round_id: @match.round_id, day_of_match: @match.day_of_match}
    assert_redirected_to match_path(assigns(:match))
  end

  test "should destroy match" do
    assert_difference('Match.count', -1) do
      delete :destroy, id: @match
    end

    assert_redirected_to matches_path
  end
end
