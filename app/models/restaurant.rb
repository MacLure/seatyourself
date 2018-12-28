class Restaurant < ApplicationRecord
    belongs_to :user
    has_many :menu_items
    has_many :reservations
    

    validate :price_range_is_between_1_and_4
    def price_range_is_between_1_and_4
      if price_range? && (price_range < 1 || price_range > 4)
        errors.add(:price_range, "must be between 1 and 4")
      end
    end 

    validate :open_from_is_between_0_and_24
    def open_from_is_between_0_and_24

      times = [
        "mon_open_from",
        "mon_open_until",
        "tues_open_from",
        "tues_open_until",
        "wed_open_from",
        "wed_open_until",
        "thurs_open_from",
        "thurs_open_until",
        "fri_open_from",
        "fri_open_until",
        "sat_open_from",
        "sat_open_until",
        "sun_open_from",
        "sun_open_until",
      ]

      times.each do |time|
        value = self.send(time)
        if value && (value < 0 || value > 24)
          errors.add(time, "must be between 0 and 24")
        end
      end
    end 

    validate :open_from_and_open_until_times_cannot_be_the_same
    def open_from_and_open_until_times_cannot_be_the_same
      if (mon_open_from == mon_open_until) || (tues_open_from == tues_open_until) || (wed_open_from == wed_open_until) || (thurs_open_from == thurs_open_until) || (fri_open_from == fri_open_until) || (sat_open_from == sat_open_until) || (sat_open_from == sat_open_until)
        errors.add(:time, ": Open from and open until cannot be the same value.")
      end
    end 

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
