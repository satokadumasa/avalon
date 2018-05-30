class NoteCategory < ApplicationRecord
  belongs_to :category
  belongs_to :note
end
