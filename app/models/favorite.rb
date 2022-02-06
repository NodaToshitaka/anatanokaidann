class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :stories
  validates_uniqueness_of :story_id, scope: :user_id
end
