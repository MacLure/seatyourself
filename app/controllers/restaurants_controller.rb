class RestaurantsController < ApplicationController
    before_action :ensure_logged_in, except: [:show, :index]

  #def require_login
    #unless session [:user_id]
    #redirect_to new_session_path
  # => end
  #end

    def index
        @restaurants = Restaurant.all
    end

    def show
        @all_restaurants = Restaurant.all
        @user = current_user
        @restaurant = Restaurant.find(params[:id])
        @menu_items = @restaurant.menu_items
        @reservations = @restaurant.reservations
    end

    def new
        @restaurant = Restaurant.new
    end

    def create
        @restaurant = Restaurant.new
        @restaurant.name = params[:restaurant][:name]
        @restaurant.mon_open_from = params[:restaurant][:mon_open_from]
        @restaurant.mon_open_until = params[:restaurant][:mon_open_until]
        @restaurant.tues_open_until = params[:restaurant][:tues_open_until]
        @restaurant.tues_open_from = params[:restaurant][:tues_open_from]
        @restaurant.wed_open_until = params[:restaurant][:wed_open_until]
        @restaurant.wed_open_from = params[:restaurant][:wed_open_from]
        @restaurant.thurs_open_until = params[:restaurant][:thurs_open_until]
        @restaurant.thurs_open_from = params[:restaurant][:thurs_open_from]
        @restaurant.fri_open_until = params[:restaurant][:fri_open_until]
        @restaurant.fri_open_from = params[:restaurant][:fri_open_from]
        @restaurant.sat_open_until = params[:restaurant][:sat_open_until]
        @restaurant.sat_open_from = params[:restaurant][:sat_open_from]
        @restaurant.sun_open_until = params[:restaurant][:sun_open_until]
        @restaurant.sun_open_from = params[:restaurant][:sun_open_from]
        @restaurant.capacity = params[:restaurant][:capacity]
        @restaurant.max_reservation_size = params[:restaurant][:max_reservation_size]
        @restaurant.price_range = params[:restaurant][:price_range]
        @restaurant.summary = params[:restaurant][:summary]
        @restaurant.user_id = current_user.id
        @restaurant.address = params[:restaurant][:address]
        @restaurant.neighbourhood = params[:restaurant][:neighbourhood]
        @restaurant.category = params[:restaurant][:category]
        
        if @restaurant.save
            redirect_to restaurants_path
            flash[:notice] = "Restaurant added."
        else
            render :new
        end
    end

    def edit
        @restaurant = Restaurant.find(params[:id])
    end

    def update
        @restaurant = Restaurant.find(params[:id])
        @restaurant.name = params[:restaurant][:name]
        @restaurant.mon_open_from = params[:restaurant][:mon_open_from]
        @restaurant.mon_open_until = params[:restaurant][:mon_open_until]
        @restaurant.tues_open_until = params[:restaurant][:tues_open_until]
        @restaurant.tues_open_from = params[:restaurant][:tues_open_from]
        @restaurant.wed_open_until = params[:restaurant][:wed_open_until]
        @restaurant.wed_open_from = params[:restaurant][:wed_open_from]
        @restaurant.thurs_open_until = params[:restaurant][:thurs_open_until]
        @restaurant.thurs_open_from = params[:restaurant][:thurs_open_from]
        @restaurant.fri_open_until = params[:restaurant][:fri_open_until]
        @restaurant.fri_open_from = params[:restaurant][:fri_open_from]
        @restaurant.sat_open_until = params[:restaurant][:sat_open_until]
        @restaurant.sat_open_from = params[:restaurant][:sat_open_from]
        @restaurant.sun_open_until = params[:restaurant][:sun_open_until]
        @restaurant.sun_open_from = params[:restaurant][:sun_open_from]
        @restaurant.capacity = params[:restaurant][:capacity]
        @restaurant.max_reservation_size = params[:restaurant][:max_reservation_size]
        @restaurant.price_range = params[:restaurant][:price_range]
        @restaurant.summary = params[:restaurant][:summary]
        @restaurant.address = params[:restaurant][:address]
        @restaurant.neighbourhood = params[:restaurant][:neighbourhood]
        @restaurant.category = params[:restaurant][:category]
        if @restaurant.save
            redirect_to restaurant_path
            flash[:notice] = "Restaurant updated."
        else
            render :edit
        end
    end

    def destroy
        @restaurant = Restaurant.find([:params])
        @restaurant.destroy
        redirect_to restaurants_path
        # ^ was user_path
        flash[:notice] = "Your restaurant was successfully removed."
    end
end


# redirect_to user_path
# flash[:notice] = "Restaurant removed."
