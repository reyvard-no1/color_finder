class Color < ApplicationRecord
  belongs_to :palette

validates :hex_code, presence: true, format: { with: /\A#[0-9A-Fa-f]{6}\z/ }
validates :percentage, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, allow_nil: true
end
