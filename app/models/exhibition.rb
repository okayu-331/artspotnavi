class Exhibition < ApplicationRecord
  belongs_to :organizer

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end
