class StoryTag < ApplicationRecord
  belongs_to :story
  belongs_to :tag
  
  validates_uniqueness_of :story_id, scope: :tag_id
end
