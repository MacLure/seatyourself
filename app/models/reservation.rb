class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :time, presence: true
  validates :party_size, presence: true
  validates :party_size, presence: true
  validates :party_size, numericality: true
  # validates :party_size, :less_than_or_equal_to: max_reservation_size
  # validates :party_size,  :less_than_or_equal_to: capacity
end
