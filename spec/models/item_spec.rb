require 'rails_helper'
describe Item do
  describe '#create' do
    it "nameがない場合は出品できないこと" do
      user = User.new(name: "", category_id: "0", content: "test", brand: "test", status: "test", postage: "test", prefecture_id: "0", shipping_days: "test", price: "9999")
      user.valid?
      expect(user.errors[:nickname]).to include("")
    end
  end
end