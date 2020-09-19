class ExhibitionEvent

  include ActiveModel::Model
  attr_accessor :title, :subtitle, :venue, :description,
  :start_date, :end_date, :basic_open_time, :basic_close_time,
  :close_day, :special_open_day, :admission, :address, :access,
  :phone_number,:url, :prefecture_id, :image, :organizer_id, :id

  with_options presence: true do
    validates :title
    validates :venue
    validates :image
    validates :start_date
    validates :end_date
    validates :basic_open_time
    validates :basic_close_time
    validates :admission
    validates :address
    validates :prefecture_id
  end

  def save
    exhibition = Exhibition.create(
      title: title, subtitle: subtitle, venue: venue, description: description, 
      start_date: start_date, end_date: end_date, basic_open_time: basic_open_time, basic_close_time: basic_close_time,
      close_day: close_day, special_open_day: special_open_day, admission: admission, address: address, access: access,
      phone_number: phone_number, url: url, prefecture_id: prefecture_id, image: image,
      organizer_id: organizer_id)

      dayarr = []
      date_start_date = Date.parse(start_date)
      date_end_date = Date.parse(end_date)

      (date_start_date..date_end_date).each do |d|
        dayarr << d
      end
      
      events = []
      dayarr.each do |day|
        events << Event.new(
          open_date: day, open_time: basic_open_time, close_time: basic_close_time,
          exhibition_id: exhibition.id, organizer_id: exhibition.organizer.id)
      end
      Event.import events
  end
end

