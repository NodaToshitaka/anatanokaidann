require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'コメント新規作成' do
    context '正常系' do
      it 'body,rateが存在すれば保存できる' do
        user = FactoryBot.build(:user)
        story = FactoryBot.build(:story, user: user)
        comment = FactoryBot.build(:comment, user: user, story: story)
        expect(comment).to be_valid
      end
    end
    context '異常系' do
      it 'bodyが存在しなければ保存できない' do
        user = FactoryBot.build(:user)
        story = FactoryBot.build(:story, user: user)
        comment = FactoryBot.build(:comment, user: user, story: story, body: nil)
        comment.valid?
        expect(comment.errors.full_messages).to include("コメントを入力してください")
      end
      
      it 'bodyが200字以内でなければ保存できない' do
        user = FactoryBot.build(:user)
        story = FactoryBot.build(:story, user: user)
        comment = FactoryBot.build(:comment, user: user, story: story, body: Faker::Lorem.characters(number: 201))
        comment.valid?
        expect(comment.errors.full_messages).to include("コメントは200文字以内で入力してください")
      end
      
      it 'rateが存在しなければ保存できない' do
        user = FactoryBot.build(:user)
        story = FactoryBot.build(:story, user: user)
        comment = FactoryBot.build(:comment, user: user, story: story, rate: nil)
        comment.valid?
        expect(comment.errors.full_messages).to include("評価は数値で入力してください", "評価を入力してください")
      end
      
    end
  end
end
