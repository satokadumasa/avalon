class Page < ApplicationRecord
  has_many :user_pages
  has_many :users, through: :user_pages

  has_many :note_pages
  has_many :notes, through: :note_pages

  has_many :pagecomment_pages, -> {order('pagecomment_id DESC')}
  has_many :pagecomments, through: :pagecomment_pages

  accepts_nested_attributes_for :user_pages, :note_pages

  validates :title, presence: true, length: { in: 1..256 }
  validates :overview , length: { maximum: 2000 }
  validates :detail, presence: true, length: { in: 1..30000 }
end
