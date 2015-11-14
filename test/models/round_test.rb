require 'test_helper'

class RoundTest < ActiveSupport::TestCase

  test "Validation Fields Required" do
    round = Round.new
    assert_not(round.save, "Nao validou corretamente")
  end

  test "Save" do
    round = Round.create(name: "Rodada 18", championship: Championship.first)
    assert(round.save, "Nao salvou corretamente")
    assert_equal(Round.last.name, "Rodada 18", "Nao salvou corretamente")
  end

  test "Update" do
    round = Round.first
    assert(round.update(name: "Rodada 33", championship: Championship.first), "Nao atualizou corretamente")
    assert_equal(Round.first.name, "Rodada 33", "Nao atualizou corretamente")
  end

  test "Destroy" do
    round = Round.find_by(name: "Rodada 3")
    round.destroy
    assert_equal(Round.all.size, 2, "Nao excluiu corretamente");
  end

  test "Find All" do
    assert_equal(Round.all.size, 3, "Nao buscou corretamente")
  end

end
