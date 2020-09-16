class Exhibition < ApplicationRecord
  belongs_to :organizer
  has_many :events
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end
