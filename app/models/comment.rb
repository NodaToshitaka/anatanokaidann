class Comment < ApplicationRecord

  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
  
  validates :body, presence: true, length: { maximum: 200 }

  belongs_to :user
  belongs_to :story
  validates_uniqueness_of :story_id, scope: :user_id
end
