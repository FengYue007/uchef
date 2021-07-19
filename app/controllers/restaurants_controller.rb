class RestaurantsController < ApplicationController

 def index
   @restaurants = Restaurant.order(id: :desc)
 end

 def show
   @restaurant = Restaurant.find(params[:id]) # 只能找id
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
   @restaurant = Restaurant.find(params[:id]) # 只能找id
 end

 private
   def restaurant_params
     params.require(:restaurant).permit(:title, :tel, :address, :email, :description)
   end
end
