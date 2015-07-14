class Round < ActiveRecord::Base
  belongs_to :championship
  validates :championship, presence: true
  validates :name, length: {minimum: 5, maximum: 20}
end
