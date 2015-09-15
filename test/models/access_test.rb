require 'test_helper'

class AccessTest < ActiveSupport::TestCase

  test "Validation Fields Required" do
    access = Access.new
    assert_not(access.save, "Nao validou corretamente")
  end

  test "Save" do
    access = Access.create(date: Time.new, user: users(:one))
    assert(access.save, "Nao salvou corretamente")
    assert_equal(Access.count, 3, "Nao salvou corretamente")
  end

  test "Destroy" do
    access = Access.first
    access.destroy
    assert_equal(Access.count, 1, "Nao excluiu corretamente");
  end

  test "Find All" do
    assert_equal(Access.all.size, 2, "Nao buscou corretamente")
  end

end
