require 'rails_helper'

RSpec.describe Story, type: :model do
 describe '投稿新規作成' do
    context '正常系' do
      it 'bodyが存在すれば保存できる' do
        story = Story.new(user_id: 1, body: 'sample text', title: 'sample title', created_at: "2022-02-10 15:16:56", updated_at: "2022-02-10 15:16:56")
        expect(story).to be_valid
      end
    end
    context '異常系' do
      it 'bodyが存在しなければ保存できない' do
        story = Story.new(user_id: 1, body: nil, title: 'sample title', created_at: "2022-02-10 15:16:56", updated_at: "2022-02-10 15:16:56")
        story.valid?
        expect(story.errors.full_messages).to include("Body can't be blank")
      end
    end
  end
end
