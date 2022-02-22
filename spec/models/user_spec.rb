require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規作成' do
    context '正常系' do
      it 'nameが存在すれば保存できる' do
        user = User.new(password: "aaa111",email: "aa@aa", name: "aaaa", introduction: nil, profile_image_id: nil, is_admin: false, is_deleted: false, created_at: "2022-02-08 22:10:10", updated_at: "2022-02-08 22:41:19")
        expect(user).to be_valid
      end
    end
    context '異常系' do
      it 'bodyが存在しなければ保存できない' do
        user = User.new(password: "aaa111",email: "aa@aa", name: nil, introduction: nil, profile_image_id: nil, is_admin: false, is_deleted: false, created_at: "2022-02-08 22:10:10", updated_at: "2022-02-08 22:41:19")
        user.valid?
        expect(user.errors.full_messages).to include("Name can't be blank")
      end
    end
  end
end
