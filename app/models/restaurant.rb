class Restaurant < ApplicationRecord
    belongs_to :user
    has_many :menu_items
    validates :name, presence: true
    validates :address, presence: true
    validates :category, presence: true
    validates :neighbourhood, presence: true
    validates :price_range, presence: true
    validates :price_range, numericality: true
    validates :capacity, presence: true
    validates :capacity, numericality: true
    validates :max_reservation_size, presence: true
    validates :max_reservation_size, presence: true
  end
