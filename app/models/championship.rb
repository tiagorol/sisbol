class Championship < ActiveRecord::Base
  has_many :rounds
  validates_presence_of :name, :start, :end
end
