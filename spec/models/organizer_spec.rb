require 'rails_helper'

RSpec.describe Organizer, type: :model do
  before do
    @organizer = FactoryBot.build(:organizer)
  end

  describe '主催者会員登録' do
    context "主催者会員登録ができる場合" do
      it "name、company_name、email、password、password_confirmationが存在すれば登録できる" do
        expect(@organizer).to be_valid
      end
    end

    context "主催者会員登録ができない場合" do
      it "nameが空の場合登録できない" do
        @organizer.name = nil
        @organizer.valid?
        expect(@organizer.errors.full_messages).to include("Name can't be blank")
      end
  
      it "nameが改行を含む場合、登録できない" do
        @organizer.name = "テス\nト123_-?@"
        @organizer.valid?
        expect(@organizer.errors.full_messages).to include("Name is invalid")
      end
  
      it "emailが空の場合、登録できない" do
        @organizer.email = nil
        @organizer.valid?
        expect(@organizer.errors.full_messages).to include("Email can't be blank")
      end
  
      it "重複したemailが存在する場合、登録できない" do
        @organizer.save
        another_organizer = FactoryBot.build(:organizer, email: @organizer.email)
        another_organizer.valid?
        expect(another_organizer.errors.full_messages).to include("Email has already been taken")
      end
  
      it "emailが@を含まない場合、登録できない" do
        @organizer.email = "aaaaaa"
        @organizer.valid?
        expect(@organizer.errors.full_messages).to include("Email is invalid")
      end
  
      it "emailが@から始まる場合、登録できない" do
        @organizer.email = "@aaaaaa"
        @organizer.valid?
        expect(@organizer.errors.full_messages).to include("Email is invalid")
      end
  
      it "emailが@で終わる場合、登録できない" do
        @organizer.email = "aaaaaa@"
        @organizer.valid?
        expect(@organizer.errors.full_messages).to include("Email is invalid")
      end
  
      it "passwordが空の場合、登録できない" do
        @organizer.password = nil
        @organizer.valid?
        expect(@organizer.errors.full_messages).to include("Password can't be blank")
      end
  
      it "passwordが7文字以下の場合、登録できない" do
        @organizer.password = "abc4567"
        @organizer.password_confirmation = "abc4567"
        @organizer.valid?
        expect(@organizer.errors.full_messages).to include("Password is invalid")
      end
  
      it "passwordが半角英文字のみの場合、登録できない" do
        @organizer.password = "abcdefgh"
        @organizer.valid?
        expect(@organizer.errors.full_messages).to include("Password is invalid")
      end
  
      it "passwordが半角数字のみの場合、登録できない" do
        @organizer.password = "12345678"
        @organizer.valid?
        expect(@organizer.errors.full_messages).to include("Password is invalid")
      end
  
      it "passwordが全角文字を含む場合、登録できない" do
        @organizer.password = "abc45678あ"
        @organizer.valid?
        expect(@organizer.errors.full_messages).to include("Password is invalid")
      end
  
      it "passwordとpassword_confirmationが一致しない場合、登録できない" do
        @organizer.password_confirmation = ""
        @organizer.valid?
        expect(@organizer.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
