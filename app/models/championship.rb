class Championship < ActiveRecord::Base
  has_many :rounds
  validates_presence_of :name, :start, :end
  validates :name, length: {minimum: 5, maximum: 20}
end
