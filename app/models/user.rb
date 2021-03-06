class User < ApplicationRecord
  has_secure_password

  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_movies, through: :favorites, source: :movie



  validates :name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_USERNAME_REGEX = /\A[A-Z0-9]+\z/i

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6, allow_blank: true }

  validates :username, uniqueness: { case_sensitive: false },
                       format: { with: VALID_USERNAME_REGEX },
                       presence: true



  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end


end
