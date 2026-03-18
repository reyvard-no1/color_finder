class Collection < ApplicationRecord

  belongs_to :user
  has_many :palettes, dependent: :destroy
  has_many :colors, through: :palettes

  validates :name, presence: true, uniqueness: { scope: :user_id }
end
