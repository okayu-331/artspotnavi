class Exhibition < ApplicationRecord
  belongs_to :organizer
  has_many :events, dependent: :destroy
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  scope :search, -> (search_params) do
    return if search_params.blank?

    prefecture_id_is(search_params[:prefecture_id])
      .keyword_like(search_params[:keyword])
      .merge(Event.open_date_is(search_params[:open_date]))
      .merge(Event.open_time_from(search_params[:open_time]))
  end

  scope :prefecture_id_is, -> (prefecture_id) { where(prefecture_id: prefecture_id) if prefecture_id.present? }
  scope :keyword_like, -> (keyword) { where("title LIKE ?", "%#{keyword}%") if keyword.present? }

  with_options presence: true do
    validates :title
    validates :venue
    validates :images
    validates :start_date
    validates :end_date
    validates :basic_open_time
    validates :basic_close_time
    validates :admission
    validates :address
    validates :prefecture_id
  end

  validate :basic_open_time_should_be_before_basic_close_time
  validate :start_date_should_be_before_end_date

  def start_date_should_be_before_end_date
    if start_date.present? && end_date.present? && start_date > end_date
      errors.add(:exhibition, "start date should be before end date")
    end
  end

  def basic_open_time_should_be_before_basic_close_time
    if basic_open_time.present? && basic_close_time.present? && basic_open_time > basic_close_time
      errors.add(:exhibition, "basic open time should be before basic close time")
    end
  end
end