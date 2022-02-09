class Story < ApplicationRecord
  belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :favorited_users, through: :favorites, source: :user
# 	has_many :post_comments, dependent: :destroy
# 	has_many :book_tags, dependent: :destroy
# 	has_many :tags, through: :book_tags

#いいね機能関連
def favorited_by?(user)
  favorites.where(user_id: user.id).exists?
end



validates :title, presence: true
validates :body, presence: true

end
