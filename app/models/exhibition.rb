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
end