class UsersController < ApplicationController
    before_action :load_restaurant
    before_action :load_menu_item
    before_action :load_reservation

    before_action :ensure_logged_in, except: [:show, :index]
    before_action :ensure_user_owns_restaurant, only: [:edit, :update, :destroy]

    def load_restaurant
        @restaurant = Restaurant.find_by(params[:id])
    end

    def load_menu_item
        @menu_item = MenuItem.find_by(params[:id])
    end

    def load_reservation
        @reservation = Reservation.find_by(params[:id])
    end

    def index

    end

    def show
      @user = User.find(params[:id])

    end

    def new
        @user = User.new
    end

    def create
        @user = User.new
        @user.name = params[:user][:name]
        @user.email = params[:user][:email]
        @user.password = params[:user][:password]
        @user.password_confirmation = params[:user][:password_confirmation]
        @user.loyalty_points = params[:user][:loyalty_points]

        if
            @user.save
            redirect_to restaurants_path
            flash[:notice] = "Welcome to Seat Yourself!"
        else
            render :new
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.name = params[:user][:name]
        @user.email = params[:user][:email]
        @user.password = params[:user][:password]
        @user.password_confirmation = params[:user][:password_confirmation]
        if
            @user.save
            redirect_to user_path
            flash[:notice] = "User info successfully updated!"
        else
            render :edit
        end
    end

    def destroy

    end

end
