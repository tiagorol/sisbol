class Access < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates :date, presence: true
end
