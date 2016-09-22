class User < ApplicationRecord
  before_save do
    email.downcase!
    self.group = 'user' unless group == 'admin'
  end

  validates :username, presence: true, length: { maximum: 40 }
  validates :password, presence: true, length: { minimum: 6 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
end
