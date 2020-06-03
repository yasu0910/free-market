require 'rails_helper'
describe Item do
  describe '商品投稿機能のバリデーション確認テスト' do

    it "全部入力されたら出品できること" do
      item = build(:item)
      item.valid?
      expect(item).to be_valid
    end
    it "nameがない場合は出品できないこと" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end
    it "category_idがない場合は出品できないこと" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end
    it "contentがない場合は出品できないこと" do
      item = build(:item, content: "")
      item.valid?
      expect(item.errors[:content]).to include("を入力してください")
    end
    it "statusがない場合は出品できないこと" do
      item = build(:item, status: "")
      item.valid?
      expect(item.errors[:status]).to include("を入力してください")
    end
    it "postageがない場合は出品できないこと" do
      item = build(:item, postage: "")
      item.valid?
      expect(item.errors[:postage]).to include("を入力してください")
    end
    it "prefecture_idがない場合は出品できないこと" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end
    it "shipping_daysがない場合は出品できないこと" do
      item = build(:item, shipping_days: "")
      item.valid?
      expect(item.errors[:shipping_days]).to include("を入力してください")
    end
    it "priceがない場合は出品できないこと" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end
  end
end