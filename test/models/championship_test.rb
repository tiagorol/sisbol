require 'test_helper'

class ChampionshipTest < ActiveSupport::TestCase
  test "Validation Fields Required" do
    championship = Championship.new
    assert_not(championship.save, "Nao validou corretamente")
  end

  test "Save" do
    championship = Championship.create(name: "Copa do mundo", start: Date.today, end: Date.today.next_day(1))
    assert(championship.save, "Nao salvou corretamente")
    assert_equal(Championship.last.name, "Copa do mundo", "Nao salvou corretamente")
  end

  test "Update" do
    championship = Championship.first
    assert(championship.update(name: "Copa America"), "Nao atualizou corretamente")
    assert_equal(Championship.first.name, "Copa America", "Nao atualizou corretamente")
  end

  test "Destroy" do
    championship = Championship.find_by(name: "Campeonato Brasileiro 2015")
    championship.destroy
    assert_equal(Championship.all.size, 1, "Nao excluiu corretamente");
  end

  test "Find All" do
    assert_equal(Championship.all.size, 2, "Nao buscou corretamente")
  end
end
