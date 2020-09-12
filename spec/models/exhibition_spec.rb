require 'rails_helper'

RSpec.describe Exhibition, type: :model do
  before do
    @exhibition = FactoryBot.build(:exhibition)
    @exhibition.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '展覧会情報の登録' do
    context "展覧会情報の登録ができる場合" do
      it "title, subtitle, venue, description, start_date, end_date, basic_open_time,
      basic_close_time, close_day, special_open_day, admission, address,
      access, phone_number, url, prefecture_id, image(png形式)が存在すれば登録できる" do
        expect(@exhibition).to be_valid
      end
      it "imageがjpg形式の場合、登録できる" do
        @exhibition.image = fixture_file_upload('public/images/test_image.jpg')
        expect(@exhibition).to be_valid
      end
      it "imageがgif形式の場合、登録できる" do
        @exhibition.image = fixture_file_upload('public/images/test_image.gif')
        expect(@exhibition).to be_valid
      end
      it "subtitleが空の場合でも、登録できる" do
        @exhibition.subtitle = nil
        expect(@exhibition).to be_valid
      end
      it "descriptionが空の場合でも、登録できる" do
        @exhibition.description = nil
        expect(@exhibition).to be_valid
      end
      it "close_dayが空の場合でも、登録できる" do
        @exhibition.close_day = nil
        expect(@exhibition).to be_valid
      end
      it "special_open_dayが空の場合でも、登録できる" do
        @exhibition.special_open_day = nil
        expect(@exhibition).to be_valid
      end
      it "accessが空の場合でも、登録できる" do
        @exhibition.access = nil
        expect(@exhibition).to be_valid
      end
      it "phone_numberが空の場合でも、登録できる" do
        @exhibition.phone_number = nil
        expect(@exhibition).to be_valid
      end
      it "urlが空の場合でも、登録できる" do
        @exhibition.url = nil
        expect(@exhibition).to be_valid
      end
    end

    context "展覧会情報の登録ができない場合" do
      it "imageが空の場合登録できない" do
        @exhibition.image = nil
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include("Image can't be blank")
      end

      it "titleが空の場合登録できない" do
        @exhibition.title = nil
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include("Title can't be blank")
      end

      it "venueが空の場合登録できない" do
        @exhibition.venue = nil
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include("Venue can't be blank")
      end

      it "start_dateが空の場合登録できない" do
        @exhibition.start_date = nil
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include("Start date can't be blank")
      end

      it "end_dateが空の場合登録できない" do
        @exhibition.end_date = nil
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include("End date can't be blank")
      end

      it "basic_open_timeが空の場合登録できない" do
        @exhibition.basic_open_time = nil
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include("Basic open time can't be blank")
      end

      it "basic_close_timeが空の場合登録できない" do
        @exhibition.basic_close_time = nil
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include("Basic close time can't be blank")
      end

      it "admissionが空の場合登録できない" do
        @exhibition.admission = nil
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include("Admission can't be blank")
      end
      
      it "addressが空の場合登録できない" do
        @exhibition.address = nil
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include("Address can't be blank")
      end

      it "prefecture_idが空の場合登録できない" do
        @exhibition.prefecture_id = nil
        @exhibition.valid?
        expect(@exhibition.errors.full_messages).to include("Prefecture can't be blank")
      end
    end
  end
end
