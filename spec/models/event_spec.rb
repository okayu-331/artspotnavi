require 'rails_helper'

RSpec.describe Event, type: :model do
  before do 
    @event = FactoryBot.build(:event)
  end

  describe '開館日の登録' do
    context "開館日の登録ができる場合" do
      it "open_date, open_time, close_time, organizer_id, exhibition_idが存在すれば登録できる" do
        expect(@event).to be_valid
      end
    end

    context "開館日の登録ができない場合" do
      it "open_dateが空の場合登録できない" do
        @event.open_date = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("Open date can't be blank")
      end
      it "open_timeが空の場合登録できない" do
        @event.open_time = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("Open time can't be blank")
      end
      it "open_dateが空の場合登録できない" do
        @event.close_time = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("Close time can't be blank")
      end
      it "open_timeがclose_timeより後の場合登録できない" do
        @event.open_time = "22:00"
        @event.valid?
        expect(@event.errors.full_messages).to include("Event open time should be before close time")
      end
    end
  end
end
