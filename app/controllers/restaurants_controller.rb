class RestaurantsController < ApplicationController
  # repo:https://stackoverflow.com/questions/3364492/actioncontrollerinvalidauthenticitytoken
  # skip_before_action :verify_authenticity_token

 def index
 end

 def new
   @restaurant = Restaurant.new
 end

 def create
   # 寫入資料庫
   # strong parameter 安全考量，github事件之後，Rails 4之後把驗證加進來。
   # r = params.require(:restaurant).permit(:title, :tel, :address, :email, :description) 
   
   # debugger # 豬八戒

   @restaurant = Restaurant.new
   @restaurant.title = params[:restaurant][:title]
   @restaurant.tel = params[:restaurant][:tel]
   @restaurant.address = params[:restaurant][:address]
   @restaurant.email = params[:restaurant][:email]
   @restaurant.description = params[:restaurant][:description]
   
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
end
