require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    
    context "ユーザ登録ができる場合" do
      it "全ての情報が含まれている場合は登録できる" do
        expect(@user).to be_valid
      end

      it "建物名が空でも登録できる" do
        @user.building = ""
        expect(@user).to be_valid
      end
    end

    context "ユーザ登録に失敗する場合" do
      it "ニックネームが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailに@がない場合は登録できない" do
        @user.email = "babachan.gmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "重複したemailがある場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid? 
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "パスワードが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "パスワードは6文字以上でないと登録できない" do
        @user.password = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "パスワードは6文字以上入力されていても半角英字のみでは登録できない" do
        @user.password = "aaaaAAAA"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "パスワードは6文字以上入力されていても半角数字のみでは登録できない" do
        @user.password = "11111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "パスワードは全角では登録できない" do
        @user.password = "パスワード"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "氏名・姓が空では登録できない" do
        @user.lastname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end

      it "氏名・姓が半角文字では登録できない" do
        @user.lastname = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname is invalid")
      end

      it "氏名・名が空では登録できない" do
        @user.firstname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end

      it "氏名・名が半角文字では登録できない" do
        @user.firstname = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname is invalid")
      end

      it "氏名・姓（かな）が空では登録できない" do
        @user.lastname_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
      end

      it "氏名・姓（かな）が半角文字では登録できない" do
        @user.lastname_kana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana is invalid")
      end

      it "氏名・名が空では登録できない" do
        @user.firstname_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end

      it "氏名・名が半角文字では登録できない" do
        @user.firstname_kana = "ｱｱｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana is invalid")
      end

      it "電話番号が空では登録できない" do
        @user.phone = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone can't be blank")
      end

      it "電話番号は10桁では登録できない" do
        @user.phone = "1234567890"
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone is invalid")
      end

      it "電話番号が11桁以上では登録できない" do
        @user.phone = "123456789012"
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone is invalid")
      end

      it "電話番号にハイフンが入っている場合は登録できない" do
        @user.phone = "080-1234-1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone is invalid")
      end

      it "郵便番号が空では登録できない" do
        @user.postcode = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Postcode can't be blank")
      end

      it "郵便番号が3桁-4桁ではないと登録できない" do
        @user.postcode = "123-45"
        @user.valid?
        expect(@user.errors.full_messages).to include("Postcode is invalid")
      end

      it "郵便番号にハイフンが無い場合は登録できない" do
        @user.postcode = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Postcode is invalid")
      end

      it "都道府県が空では登録できない" do
        @user.prefecture_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "都道府県は0が選択された状態では登録できない" do
        @user.prefecture_id = 0
        @user.valid?
        expect(@user.errors.full_messages).to include("Prefecture must be other than 0")
      end

      it "市名・町名・村名が空では登録できない" do
        @user.city = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("City can't be blank")
      end

      it "番地等が空では登録できない" do
        @user.address = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Address can't be blank")
      end
    end
  end
end
