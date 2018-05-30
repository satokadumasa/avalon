class Note < ApplicationRecord
  has_many :user_notes
  has_many :users, through: :user_notes

  has_many :note_categories
  has_many :categories, through: :note_categories

  has_many :note_pages
  has_many :pages, through: :note_pages

  accepts_nested_attributes_for :user_notes, :note_categories, :categories

  validates :title, presence: true, length: { in: 1..256 }
  validates :overview , length: { maximum: 2000 }
  validates :detail, presence: true, length: { in: 1..30000 }
end
