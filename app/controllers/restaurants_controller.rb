class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]
  # before_action :find_restaurant, except: [:index, :new, :create]

 def index
   @restaurants = Restaurant.available
 end

 def show
   # @restaurant = Restaurant.find(params[:id]) # 只能找id
 end

 def new
   @restaurant = Restaurant.new
 end

 def create
   @restaurant = Restaurant.new(restaurant_params)
   
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
   def find_restaurant
     @restaurant = Restaurant.find(params[:id]) 
   end

   def restaurant_params
     params.require(:restaurant).permit(:title, :tel, :address, :email, :description)
   end
end
