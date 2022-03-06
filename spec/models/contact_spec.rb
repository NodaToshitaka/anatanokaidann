require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'お問い合わせ新規作成' do
    context '正常系' do
      it 'name,email,phone_number,messageが存在すれば保存できる' do
        contact = FactoryBot.build(:contact)
        expect(contact).to be_valid
      end
    end
    context '異常系' do
      it 'nameが存在しなければ保存できない' do
        contact = FactoryBot.build(:contact, name: nil)
        contact.valid?
        expect(contact.errors.full_messages).to include("名前を入力してください")
      end
      
      it 'emailが存在しなければ保存できない' do
        contact = FactoryBot.build(:contact, email: nil)
        contact.valid?
        expect(contact.errors.full_messages).to include("メールアドレスを入力してください")
      end
      
      it 'phone_numberが存在しなければ保存できない' do
        contact = FactoryBot.build(:contact, phone_number: nil)
        contact.valid?
        expect(contact.errors.full_messages).to include("電話番号を入力してください")
      end
      
      it 'messageが存在しなければ保存できない' do
        contact = FactoryBot.build(:contact, message: nil)
        contact.valid?
        expect(contact.errors.full_messages).to include("メッセージを入力してください")
      end
      
    end
  end
end
