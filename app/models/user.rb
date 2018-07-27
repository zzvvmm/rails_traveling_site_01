class User < ApplicationRecord
  before_save :downcase_email

  has_many :chatrooms, through: :messages
  has_many :comments, dependent: :destroy
  has_many :messages
  has_many :participations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :trips, through: :participations

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,  presence: true, length:
    {maximum: Settings.user.name.maximum}
  validates :email, presence: true,
    length: {maximum: Settings.user.email.maximum},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.user.password.minimum}, allow_nil: true

  has_secure_password

  private

  def downcase_email
    email.downcase!
  end

  def feed
    Review.where "user_id = ?", id
  end
end
