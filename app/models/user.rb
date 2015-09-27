require 'digest/sha1'

class User < ActiveRecord::Base

  validates :name, length: {minimum: 2, maximum: 30}, :presence => true
  validates :surname, length: {minimum: 2, maximum: 30}, :presence => true
  validates :date_of_birth, :presence => true
  validates :email, length: {minimum: 2, maximum: 50}, presence: true, email: true, uniqueness: true
  validates :password, length: {minimum: 5, maximum: 50}, confirmation: true
  validates :password_confirmation, presence: true

  def authenticate(password)
    self.password.eql?Digest::SHA1.hexdigest(password)
  end
end
