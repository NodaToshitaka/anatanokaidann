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
        expect(user.errors.full_messages).to include("ユーザーネームを入力してください")
      end
      
      it 'emailが存在しなければ保存できない' do
        user = FactoryBot.build(:user, email: nil)
        user.valid?
        expect(user.errors.full_messages).to include("メールアドレスを入力してください")
      end
      
      it 'passwordが存在しなければ保存できない' do
        user = FactoryBot.build(:user, password: nil)
        user.valid?
        expect(user.errors.full_messages).to include("パスワードを入力してください")
      end
      
      it 'passwordが6文字以下だと保存できない' do
        user = FactoryBot.build(:user, password: "test1" )
        
        user.valid?
        expect(user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      
      it 'introductionが200字いないでなければ保存できない' do
        user = FactoryBot.build(:user, introduction: Faker::Lorem.characters(number: 201))
        user.valid?
        expect(user.errors.full_messages).to include("紹介文は200文字以内で入力してください")
      end
      
      it 'nameが同じだと保存できない' do
        FactoryBot.build(:user).save
        user = FactoryBot.build(:user, email: "test2@test2", password: "test222" )
        
        user.valid?
        expect(user.errors.full_messages).to include( "ユーザーネームはすでに存在します")
      end
      
      it 'emailが同じだと保存できない' do
        FactoryBot.build(:user).save
        user = FactoryBot.build(:user, name: "testuser2", password: "test222" )
        
        user.valid?
        expect(user.errors.full_messages).to include("メールアドレスはすでに存在します")
      end
      
    end
  end
end
