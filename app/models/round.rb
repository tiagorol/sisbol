class Round < ActiveRecord::Base
  validates :name, length: {
      minimum: 5,
      maximum: 20,
      too_short: "must have at least %{count} words",
      too_long: "must have at most %{count} words"
  }
end
