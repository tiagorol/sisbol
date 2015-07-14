class Round < ActiveRecord::Base
  belongs_to :championship
  validates :championship, presence: true
  validates :name, length: {
      minimum: 5,
      maximum: 20,
      too_short: "must have at least %{count} words",
      too_long: "must have at most %{count} words"
  }
end
