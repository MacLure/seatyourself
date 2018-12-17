class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validate :reservation_date_cannot_be_in_the_past

  def reservation_date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end 

  validate :reservation_time_cant_be_outside_open_hours
  def reservation_time_cant_be_outside_open_hours
    if date.wday == 0
      if time < self.restaurant.sun_open_from || time > self.restaurant.sun_open_until
        errors.add(:time, ": The restaurant open from #{self.restaurant.sun_open_from} to #{self.restaurant.sun_open_until} on this day.")
      end
    elsif date.wday == 1
      if time < self.restaurant.mon_open_from || time > self.restaurant.mon_open_until
        errors.add(:time, ": The restaurant open from #{self.restaurant.mon_open_from} to #{self.restaurant.mon_open_until} on this day.")
      end
    elsif date.wday == 2
      if time < self.restaurant.tues_open_from || time > self.restaurant.tues_open_until
        errors.add(:time, ": The restaurant open from #{self.restaurant.tues_open_from} to #{self.restaurant.tues_open_until} on this day.")
      end
    elsif date.wday == 3
      if time < self.restaurant.wed_open_from || time > self.restaurant.wed_open_until
        errors.add(:time, ": The restaurant open from #{self.restaurant.wed_open_from} to #{self.restaurant.wed_open_until} on this day.")
      end
    elsif date.wday == 4
      if time < self.restaurant.thurs_open_from || time > self.restaurant.thurs_open_until
        errors.add(:time, ": The restaurant open from #{self.restaurant.thurs_open_from} to #{self.restaurant.thurs_open_until} on this day.")
      end
    elsif date.wday == 5
      if time < self.restaurant.fri_open_from || time > self.restaurant.fri_open_until
        errors.add(:time, ": The restaurant open from #{self.restaurant.fri_open_from} to #{self.restaurant.fri_open_until} on this day.")
      end
    elsif date.wday == 6
      if time < self.restaurant.sat_open_from || time > self.restaurant.sat_open_until
        errors.add(:time, ": The restaurant open from #{self.restaurant.sat_open_from} to #{self.restaurant.sat_open_until} on this day.")
      end
    end
  end 

  validate :reservation_size_cant_be_larger_than_restaurant_max_reservatin_size
  def reservation_size_cant_be_larger_than_restaurant_max_reservatin_size
    if party_size && party_size > self.restaurant.max_reservation_size
      errors.add(:party_size, ": The maximum party size at this restaurant is #{self.restaurant.max_reservation_size}.")
    end
  end 

  validates :time, presence: true
  validates :party_size, presence: true
  validates :party_size, presence: true
  validates :party_size, numericality: true
  # validates :party_size, :less_than_or_equal_to: max_reservation_size
  # validates :party_size,  :less_than_or_equal_to: capacity
end
