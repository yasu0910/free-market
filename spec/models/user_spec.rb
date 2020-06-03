require 'rails_helper'
describe User do
  describe '#create' do

    it "nickname,email,password,first_name,last_name,first_name_hurigana,last_name_hurigana,birthdayが存在すれば登録できること" do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end
    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "重複したemailが存在する場合は登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end
    it "last_nameがない場合は登録できないこと" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end
    it "first_name_huriganaがない場合は登録できないこと" do
      user = build(:user, first_name_hurigana: "")
      user.valid?
      expect(user.errors[:first_name_hurigana]).to include("を入力してください")
    end
    it "last_name_huriganaがない場合は登録できないこと" do
      user = build(:user, last_name_hurigana: "")
      user.valid?
      expect(user.errors[:last_name_hurigana]).to include("を入力してください")
    end
    it "birthdayがない場合は登録できないこと" do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end
  end
end