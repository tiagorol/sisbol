require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  test "Validation Fields Required" do
    match = Match.new
    assert_not(match.save, "Nao validou corretamente")
  end

  test "Save" do
    match = Match.new(championship_id: Championship.find_by_name("Campeonato Brasileiro 2015").id, round_id: Round.find_by_name("Rodada 1").id, home_team_id: Team.first.id, away_team_id: Team.second.id, goals_home_team: 2, goals_away_team: 2, day_of_match: Date.today)
    match.championship = Championship.find_by_name("Campeonato Brasileiro 2015")
    match.round = Round.find_by_name("Rodada 1")
    assert(match.save, "Nao salvou corretamenteeeeee")
    assert_equal(Match.last.day_of_match, Date.today, "Nao salvou corretamente 2")
  end

  test "Update" do
    match = Match.first
    assert(match.update(goals_home_team: 5), "Nao atualizou corretamente")
    assert_equal(Match.first.goals_home_team, 5, "Nao atualizou corretamente")
  end

  test "Destroy" do
    match = Match.find_by_championship_id(1)
    match.destroy
    assert_equal(Match.all.size, 1, "Nao excluiu corretamente");
  end

  test "Find All" do
    assert_equal(Match.all.size, 2, "Nao buscou corretamente")
  end
end
