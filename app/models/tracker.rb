class Tracker < ApplicationRecord

  has_many :location_histories, dependent: :destroy
  has_one_attached :image
  validates :reference_number, presence: true, uniqueness: true
  validates :name, presence: true
  validates :description, presence: true
  
  def image_path
    return Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true) if image.attached?
  end
end
