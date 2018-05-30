class User < ApplicationRecord
  rolify

  has_many :user_notes
  has_many :notes, through: :user_notes

  has_many :user_pages
  has_many :pages, through: :user_pages

  accepts_nested_attributes_for :user_notes
  accepts_nested_attributes_for :notes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :username, presence: true, length: { in: 1..256 }
end
