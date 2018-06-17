class UserPagecomment < ApplicationRecord
  belongs_to :user
  belongs_to :pagecomment
end
