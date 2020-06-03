require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'クレジットカード登録のバリデーション確認テスト' do
    it 'クレジットカードが登録される' do
      card = build(:card)
      card.valid?
      expect(card).to be_valid
    end
    it 'customer_idがないと登録できない' do
      card = build(:card, customer_id: "")
      card.valid?
      expect(card.errors[:customer_id]).to include("を入力してください")
    end
    it 'card_idがないと登録できない' do
      card = build(:card, card_id: "")
      card.valid?
      expect(card.errors[:card_id]).to include("を入力してください")
    end
  end
end
