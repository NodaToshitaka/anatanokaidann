require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規作成' do
    context '正常系' do
      it 'name,email,paswordが存在すれば保存できる' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
    end
    context '異常系' do
      it 'nameが存在しなければ保存できない' do
        user = FactoryBot.build(:user, name: nil)
        user.valid?
        expect(user.errors.full_messages).to include("Name can't be blank")
      end
      
      it 'emailが存在しなければ保存できない' do
        user = FactoryBot.build(:user, email: nil)
        user.valid?
        expect(user.errors.full_messages).to include("Email can't be blank")
      end
      
      it 'passwordが存在しなければ保存できない' do
        user = FactoryBot.build(:user, password: nil)
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank")
      end
      
      it 'introductionが200字いないでなければ保存できない' do
        user = FactoryBot.build(:user, introduction: Faker::Lorem.characters(number: 201))
        user.valid?
        expect(user.errors.full_messages).to include("Introduction is too long (maximum is 200 characters)")
      end
    end
  end
end
