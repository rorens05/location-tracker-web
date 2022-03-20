class Tracker < ApplicationRecord
  has_one_attached :image
  validates :reference_number, presence: true, uniqueness: true
  validates :name, presence: true
  validates :description, presence: true
end
