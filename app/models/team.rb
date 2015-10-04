class Team < ActiveRecord::Base
  validates :description, length: {minimum: 5, maximum: 100}, presence: true
  validates :full_description, length: {minimum: 5, maximum: 255}, presence: true
  has_attached_file :crest, styles: { medium: '300x300>', thumb: '100x100>'}
  validates_attachment_content_type :crest, content_type: /\Aimage\/.*\Z/
end
