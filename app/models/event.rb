class Event < ApplicationRecord
  belongs_to :exhibition

  with_options presence: true do
    validates :open_date
    validates :open_time
    validates :close_time
  end
end