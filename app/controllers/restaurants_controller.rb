class RestaurantsController < ApplicationController
  # repo:https://stackoverflow.com/questions/3364492/actioncontrollerinvalidauthenticitytoken
  # skip_before_action :verify_authenticity_token

 def index
 end

 def new
   @restaurant = Restaurant.new
 end

 def create

   if restaurant_params[:title] != ''
    render html: '請輸入title'
   end
   @restaurant = Restaurant.new(restaurant_params)
   
   if @restaurant.save
     redirect_to '/restaurants'
   else
     # .....
   end
   # redirect -> 列表頁
   # render html: "Title is #{params[:title]}
   # render html: "Title is #{params[:title]}、Tel is #{params[:tel]}、Address #{params[:address]}、Description is #{params[:description]}"
   # redirect_to '/restaurants' 
 end

 private
   def restaurant_params
     params.require(:restaurant).permit(:title, :tel, :address, :email, :description)
     # params[:restaurant].permit(:title, :tel, :address, :email, :description)
   end
end
