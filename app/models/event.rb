class Event < ApplicationRecord
  belongs_to :exhibition
  belongs_to :organizer

  scope :open_date_is, -> (open_date) { where(open_date: open_date) if open_date.present? }
  scope :open_time_from, -> (open_time) { where("? between open_time and close_time", open_time) if open_time.present? }

end