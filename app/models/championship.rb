class Championship < ActiveRecord::Base
  has_many :rounds
  validates_presence_of :name, :start, :end
  validates :name, length: {minimum: 5, maximum: 20}
  before_destroy :has_rounds

  private

  def has_rounds
    if rounds.any?
      if rounds.size == 1
        errors[:base] = I18n.translate('.errors.messages.restrict_dependent_destroy.one', :record => rounds.size)
      else
        errors[:base] = I18n.translate('.errors.messages.restrict_dependent_destroy.many', :record => rounds.size)
      end
      return false
    end
  end

end
