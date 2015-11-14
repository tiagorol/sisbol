require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test "Validation Fields Required" do
    team = Team.new
    assert_not(team.save, "Nao validou corretamente")
  end

  test "Save" do
    team = Team.create(description: "Ferroviario", full_description: "Ferroviario Atletico Clube")
    assert(team.save, "Nao salvou corretamente")
    assert_equal(Team.last.description, "Ferroviario", "Nao salvou corretamente")
  end

  test "Update" do
    team = Team.first
    assert(team.update(description: "Ferrao"), "Nao atualizou corretamente")
    assert_equal(Team.first.description, "Ferrao", "Nao atualizou corretamente")
  end

  test "Destroy" do
    team = Team.find_by(description: "Icasa")
    team.destroy
    assert_equal(Team.all.size, 2, "Nao excluiu corretamente");
  end

  test "Find All" do
    assert_equal(Team.all.size, 3, "Nao buscou corretamente")
  end
end
