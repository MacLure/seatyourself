class ReservationsController < ApplicationController

    # def index

    # end

    # def show

    # end

    def new

    end

    def create
        @reservation = Reservation.new
        @reservation.user_id = params[:reservation][:user_id]

        @reservation.restaurant_id = params[:reservation][:restaurant_id]
        @reservation.time = params[:reservation][:time]
        @reservation.party_size = params[:reservation][:party_size]

        @restaurant = Restaurant.find(params[:restaurant_id])
        @reservation.restaurant =  @restaurant.id
        @reservations = @restaurant.reservations


        # @reservation.user_id = current_user.id

        if @reservation.save
          redirect_to restaurant_path(@restaurant)
          flash[:notice] = "Reservation made!"

        else
          render restaurant_path
        end
    end

    def edit
        @reservation = Reservation.find(params[:id])
        @restaurant = Restaurant.find(params[:product_id])
        @reservation.restaurant = @restaurant
    end

    def update
        @reservation = Reservation.find(params[:id])
        @restaurant = Restaurant.find(params[:restaurant_id])

        @reservation.restaurant_id = params[:reservation][:restaurant_id]
        @reservation.time = params[:reservation][:time]
        @reservation.party_size = params[:reservation][:party_size]
        @reservation.product = @restaurant

        if @reservation.save
          redirect_to restaurant_path(@restaurant)
          flash[:notice] = "Reservation updated."
        else
          render reservation_path
        end
    end

    def destroy
        @reservation = Reservation.find(params[:id])
        @restaurant = Restaurant.find(params[:restaurant_id])
        @reservation.restaurant = @restaurant
        @reservation.destroy
        redirect_to restaurant_path(@restaurant)
        flash[:notice] = "Reservation cancelled."
    end

end


# class ReservationsController < ApplicationController

#     def index
#       @reservations = Reservation.all
#     end

#     def show
#       @reservation = Reservation.find(params[:id])
#     end

#     def new
#       @reservation = Reservation.new
#     end

#     def create
#         @reservation = Reservation.new
#         @reservation.user_id = current_user.id
#         # @reservation.user_id = params[:reservation][:user_id]

#         @reservation.restaurant_id = params[:reservation][:restaurant_id]
#         @reservation.time = params[:reservation][:time]
#         @reservation.party_size = params[:reservation][:party_size]
#         # @restaurant = Restaurant.find(params[:restaurant_id])
#         @reservation.restaurant =  @restaurant.id
#         @reservations = @restaurant.reservations


#         if @reservation.save
#           redirect_to restaurant_path(@restaurant)
#         else
#           render restaurant_path
#         end
#     end

#     def edit
#         @reservation = Reservation.find(params[:id])
#         @restaurant = Restaurant.find(params[:product_id])
#         @reservation.restaurant = @restaurant
#     end

#     def update
#         @reservation = Reservation.find(params[:id])
#         @restaurant = Restaurant.find(params[:restaurant_id])

#         @reservation.restaurant_id = params[:reservation][:restaurant_id]
#         @reservation.time = params[:reservation][:time]
#         @reservation.party_size = params[:reservation][:party_size]
#         @reservation.product = @restaurant

#         if @reservation.save
#           redirect_to restaurant_path(@restaurant)
#         else
#           render reservation_path
#         end
#     end

#     def destroy
#         @reservation = Reservation.find(params[:id])
#         @restaurant = Restaurant.find(params[:restaurant_id])
#         @reservation.restaurant = @restaurant
#         @reservation.destroy
#         redirect_to restaurant_path(@restaurant)
#     end

# end


# OLD CREATE METHOD:
# def create
#     @reservation = Reservation.new
#     @reservation.user_id = params[:reservation][:user_id]
#
#     @reservation.restaurant_id = params[:reservation][:restaurant_id]
#     @reservation.time = params[:reservation][:time]
#     @reservation.party_size = params[:reservation][:party_size]
#
#     @restaurant = Restaurant.find(params[:restaurant_id])
#     @reservation.restaurant =  @restaurant.id
#     @reservations = @restaurant.reservations
#
#     # @reservation.user_id = current_user.id
#
#     if @reservation.save
#       redirect_to restaurant_path(@restaurant)
#     else
#       render restaurant_path
#     end
# end
