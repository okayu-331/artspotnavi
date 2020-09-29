class Event < ApplicationRecord
  belongs_to :exhibition
  belongs_to :organizer

  scope :open_date_is, -> (open_date) { where(open_date: open_date) if open_date.present? }
  scope :open_time_from, -> (open_time) { where("? between open_time and close_time", open_time) if open_time.present? }

  validate :open_time_should_be_before_close_time

  with_options presence: true do
    validates :open_date
    validates :open_time
    validates :close_time
  end

  def open_time_should_be_before_close_time
    if open_time.present? && close_time.present? && open_time > close_time
      errors.add(:event, "open time should be before close time")
    end
  end
end