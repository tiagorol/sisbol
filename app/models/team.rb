class Team < ActiveRecord::Base
  validates :description, length: {minimum: 5, maximum: 60}, presence: true
  validates :full_description, length: {minimum: 5, maximum: 100}, presence: true
  has_attached_file :crest, styles: { thumb: '100x100>', small: '30x30'}
  validates_attachment_content_type :crest, content_type: /\Aimage\/.*\Z/

  def url_crest_small
    if self.crest_file_name.nil?
      return "crest_small.jpg"
    end
    return self.crest.url(:small)
  end

  def url_crest_thumb
    if self.crest_file_name.nil?
      return "crest_thumb.png"
    end
    return self.crest.url(:thumb)
  end
end