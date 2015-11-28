require 'digest/sha1'

class User < ActiveRecord::Base
  enum role: [:normal_user, :admin]

  validates :name, length: {minimum: 2, maximum: 30}, :presence => true
  validates :surname, length: {minimum: 2, maximum: 30}, :presence => true
  validates :date_of_birth, :presence => true
  validates :email, length: {minimum: 2, maximum: 50}, presence: true, email: true, uniqueness: true
  validates :password, length: {minimum: 5, maximum: 50}, confirmation: true
  validates :password_confirmation, presence: true
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def url_avatar
    if self.avatar_file_name.nil?
      return "find_user.png"
    end
    return self.avatar.url(:medium)
  end

  def url_avatar_thumb
    if self.avatar_file_name.nil?
      return "find_user_thumb.png"
    end
    return self.avatar.url(:thumb)
  end

  def authenticate(password)
    self.password.eql?Digest::SHA1.hexdigest(password)
  end
end
