class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:edit, :update, :destroy]
  # before_action :find_restaurant, except: [:index, :new, :create]
  before_action :check_user!, except: [:index, :show]

 def index
   @restaurants = Restaurant.all
 end

 def show
   @restaurant = Restaurant.find(params[:id]) 
 end

 def new
   @restaurant = Restaurant.new
 end

 def create
   # @restaurant = Restaurant.new(restaurant_params)
   # @restaurant.user_id = current_user.id

   # @restaurant = Restaurant.new(restaurant_params)
   # @restaurant.user = current_user
   @restaurant = current_user.restaurants.new(restaurant_params)
   
   if @restaurant.save
     redirect_to restaurants_path
   else
     render :new # 借new.html.erb
   end
 end

 def edit
   # @restaurant = Restaurant.find(params[:id]) # 只能找id
 end

 def update
   # @restaurant = Restaurant.find(params[:id]) # 只能找id

   if @restaurant.update(restaurant_params)
     redirect_to restaurant_path(@restaurant)
   else
     render :edit
   end
 end

 def destroy
   # @restaurant = Restaurant.find(params[:id])
   @restaurant.destroy
   redirect_to restaurants_path 
 end

 private
   # authentication 指允許可以進來這個大門，代表有認證。 但不能進去。 (驗證)
   # authorization 有沒有授權，可不可以做這件事情。                   (授權)
   # 1
   def find_restaurant
     # @restaurant = Restaurant.find(params[:id]) 
     # @restaurant = Restaurant.find_by!(
     #   id: params[:id],
     #   user_id: current_user:id
     # )
   # 2
     @restaurant = current_user.restaurants.find(params[:id])
   end

   def restaurant_params
     params.require(:restaurant).permit(:title, :tel, :address, :email, :description)
   end

end
