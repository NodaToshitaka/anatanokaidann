class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :story
  validates_uniqueness_of :story_id, scope: :user_id
end
