require 'test_helper'

class RoundTest < ActiveSupport::TestCase

  test "Validation Fields Required" do
    round = Round.new
    assert_not(round.save, "Nao validou corretamente")
  end

  test "Save" do
    round = Round.create(name: "Rodada 18", championship: Championship.first)
    assert(round.save, "Nao salvou corretamente")
    assert_equal(Round.last.name, "Rodada 18", "Nao salvou corretamente");
  end

  test "Find All" do
    rounds = Round.all
    assert_equal(rounds.size, 2, "Nao buscou corretamente");
  end

end
