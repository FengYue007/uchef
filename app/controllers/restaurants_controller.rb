class RestaurantsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

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

 private
   def restaurant_params
     params.require(:restaurant).permit(:title, :tel, :address, :email, :description)
   end

   def not_found
     # redirect_to restaurants_path
     render file: "#{Rails.root}/public/404.html", status: 404
   end
end
