class Offer < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many_attached :photos
  validates :photos, presence: true

  validates :photos, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
  pg_search_scope :search_by_location,
    against: [:location],
    using: {
      tsearch: { prefix: true }
    }
end
