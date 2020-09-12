class Exhibition < ApplicationRecord
  belongs_to :organizer
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
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
end
