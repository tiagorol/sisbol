class Dispute < ActiveRecord::Base
  enum status: [:open, :finalized]

  belongs_to :championship
  validates :description, length: {minimum: 2, maximum: 60}, presence: true
  validates :status, presence: true
  validates :championship, presence: true
end
