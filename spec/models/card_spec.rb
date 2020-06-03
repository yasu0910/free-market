require 'rails_helper'

RSpec.describe Card, type: :model do
  let(:user) { create(:user) }
  describe '#create' do
    it 'クレジットカードが登録される' do
      card = build(:card, user_id: user.id)
      card.valid?
      expect(card).to be_valid
    end
    it 'customer_idがないと登録できない' do
      card = build(:card, user_id: user.id, customer_id: "")
      card.valid?
      expect(card.errors[:customer_id]).to include("を入力してください")
    end
    it 'card_idがないと登録できない' do
      card = build(:card, user_id: user.id, card_id: "")
      card.valid?
      expect(card.errors[:card_id]).to include("を入力してください")
    end
  end
end
