class User < ApplicationRecord
    has_secure_password

    has_many :restaurants
    has_many :reservations
    # has_many :menu_items, :through restaurant

    validates :name, presence: true
    validates :email, presence: true
    # validates :password, presence: true
    # validates :password_confirmation
    #test that password and confirmation match - we don't seem to have password confirmation at this point.
end
