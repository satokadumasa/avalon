class Pagecomment < ApplicationRecord
  has_many :user_pagecomments
  has_many :users, through: :user_pagecomments

  has_many :pagecomment_pages
  has_many :pages, through: :pagecomment_pages

  accepts_nested_attributes_for :user_pagecomments,:pagecomment_pages

  validates :title, presence: true, length: { in: 1..256 }
  validates :detail, presence: true, length: { in: 1..3000 }
end
