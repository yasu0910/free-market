require 'rails_helper'
describe DeliveryInfo do
  describe '本人確認情報のバリデーション確認テスト' do
    it "first_name,last_name,first_name_hurigana,last_name_hurigana,postal_code,prefecture_id,city,streetが存在すれば登録できること" do
      delivery_info = build(:delivery_info)
      delivery_info.valid?
      expect(delivery_info).to be_valid
    end
    it "first_nameがない場合は登録できないこと" do
      delivery_info = build(:delivery_info, first_name: "")
      delivery_info.valid?
      expect(delivery_info.errors[:first_name]).to include("を入力してください")
    end
    it "last_nameがない場合は登録できないこと" do
      delivery_info = build(:delivery_info, last_name: "")
      delivery_info.valid?
      expect(delivery_info.errors[:last_name]).to include("を入力してください")
    end
    it "first_name_huriganaがない場合は登録できないこと" do
      delivery_info = build(:delivery_info, first_name_hurigana: "")
      delivery_info.valid?
      expect(delivery_info.errors[:first_name_hurigana]).to include("を入力してください")
    end
    it "last_name_huriganaがない場合は登録できないこと" do
      delivery_info = build(:delivery_info, last_name_hurigana: "")
      delivery_info.valid?
      expect(delivery_info.errors[:last_name_hurigana]).to include("を入力してください")
    end
    it "postal_codeがない場合は登録できないこと" do
      delivery_info = build(:delivery_info, postal_code: "")
      delivery_info.valid?
      expect(delivery_info.errors[:postal_code]).to include("を入力してください")
    end
    it "prefecture_idがない場合は登録できないこと" do
      delivery_info = build(:delivery_info, prefecture_id: "")
      delivery_info.valid?
      expect(delivery_info.errors[:prefecture_id]).to include("を入力してください")
    end
    it "cityがない場合は登録できないこと" do
      delivery_info = build(:delivery_info, city: "")
      delivery_info.valid?
      expect(delivery_info.errors[:city]).to include("を入力してください")
    end
    it "streetがない場合は登録できないこと" do
      delivery_info = build(:delivery_info, street: "")
      delivery_info.valid?
      expect(delivery_info.errors[:street]).to include("を入力してください")
    end
  end
end