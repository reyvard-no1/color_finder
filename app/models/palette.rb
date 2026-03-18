class Palette < ApplicationRecord
  belongs_to :user
  belongs_to :collection

  has_many :colors, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true
end
