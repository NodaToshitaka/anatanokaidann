require 'rails_helper'

RSpec.describe Story, type: :model do
 describe '投稿新規作成' do
    context '正常系' do
      it 'body,titleが存在すれば保存できる' do
        user = FactoryBot.build(:user)
        story = FactoryBot.build(:story, user: user)
        expect(story).to be_valid
      end
    end
    context '異常系' do
      it 'bodyが存在しなければ保存できない' do
        user = FactoryBot.build(:user)
        story = FactoryBot.build(:story, user: user, body: nil)
        story.valid?
        expect(story.errors.full_messages).to include("本文を入力してください")
      end
      
      it 'titleが存在しなければ保存できない' do
        user = FactoryBot.build(:user)
        story = FactoryBot.build(:story, user: user, title: nil)
        story.valid?
        expect(story.errors.full_messages).to include("タイトルを入力してください")
      end
      
      it 'titleが同じであれば保存できない' do
        user = FactoryBot.build(:user)
        FactoryBot.build(:story, user: user).save
        story = FactoryBot.build(:story, user: user, body: "testbody2")
        story.valid?
        expect(story.errors.full_messages).to include("タイトルはすでに存在します")
      end
    end
  end
end
