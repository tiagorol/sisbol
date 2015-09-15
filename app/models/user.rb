require 'digest/sha1'

class User < ActiveRecord::Base

  validates :name, length: {minimum: 2, maximum: 30}, :presence => true
  validates :surname, length: {minimum: 2, maximum: 30}, :presence => true
  validates :date_of_birth, :presence => true
  validates :email, presence: true, email: true
  validates :password, length: {minimum: 5, maximum: 100}, confirmation: true
  validates_confirmation_of :password

  def authenticate(password)
    self.password.eql?Digest::SHA1.hexdigest(password)
  end
end
