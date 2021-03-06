class Story < ApplicationRecord
  belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :favorited_users, through: :favorites, source: :user
	has_many :comments, dependent: :destroy
	has_many :story_tags, dependent: :destroy
	has_many :tags, through: :story_tags
	
	validates :title, presence: true, uniqueness: true
  validates :body, presence: true

#いいね機能関連
def favorited_by?(user)
  favorites.where(user_id: user.id).exists?
end

#タグ機能関連

def tag_names
  tags.pluck(:tag_name).join(',')
end

def tags_save(tag_list)
  if self.tags != nil
    story_tags_records = StoryTag.where(story_id: self.id)
    story_tags_records.destroy_all
  end

  tag_list.each do |tag|
    inspected_tag = Tag.where(tag_name: tag).first_or_create
    self.tags << inspected_tag
  end
end

#検索機能関連
def self.looks(search, word)
  if search == "perfect_match"
    @story = Story.where("title LIKE?","#{word}")
  elsif search == "forward_match"
    @story = Story.where("title LIKE?","#{word}%")
  elsif search == "backward_match"
    @story = Story.where("title LIKE?","%#{word}")
  elsif search == "partial_match"
    @story = Story.where("title LIKE?","%#{word}%")
  else
    @story = Story.all
  end
end

#ソート機能関連
def self.sort(selection)
  case selection
  when "new"
    return all.order(created_at: :DESC)
  when "old"
    return all.order(created_at: :ASC)
  when "favorite"
    return find(Favorite.group(:story_id).order('count(story_id) DESC').pluck(:story_id))
  when "disfavor"
    return find(Favorite.group(:story_id).order('count(story_id) ASC').pluck(:story_id))
  when "many_comments"
    return find(Comment.group(:story_id).order('count(story_id) DESC').pluck(:story_id))
  when "few_comments"
    return find(Comment.group(:story_id).order('count(story_id) ASC').pluck(:story_id))
  end
end

#評価平均
def avg_rate
  if self.comments.present?
    comments.average(:rate).round(1)
  else
    0.0
  end
end

#評価合計
def total_rate
  if self.comments.present?
    comments.all.sum(:rate)
  else
    0.0
  end
end

def self.rank
  self.left_joins(:comments).group(:id).order("avg(comments.rate) DESC")
end




end
