class User < ApplicationRecord
  rolify

  has_many :user_notes
  has_many :notes, through: :user_notes

  has_many :user_pages
  has_many :pages, through: :user_pages

  has_many :bookmarks
  has_many :notes, through: :bookmarks

  has_many :user_pagecomments
  has_many :pagecomments, through: :user_pagecomments

  has_one :user_profile
  
  accepts_nested_attributes_for :user_notes
  accepts_nested_attributes_for :notes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :username, presence: true, length: { in: 1..256 }

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20],
        confirmed_at: Date.today.to_time,
        username: auth.info.nickname
      )
    end

    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
