class RestaurantsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :not_found

 def index
   @restaurants = Restaurant.order(id: :desc)
   # @restaurants = Restaurant.where("title like '%新增餐廳%'")  #摸糊比對 第一個%找新前面有的字，第二個%找廳後面有的字。
 end

 def show
     @restaurant = Restaurant.find(params[:id]) # 只能找id
     # Exception 例外
     # Error 錯誤
 end

 def new
   @restaurant = Restaurant.new
 end

 def create
   @restaurant = Restaurant.new(restaurant_params)
   
   if @restaurant.save
     redirect_to restaurants_path
   else
     # redirect_to new_restaurant_path
     render :new # 借new.html.erb
     # render action: :new
     # render html: '資料發生錯誤'
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

   def not_found
     redirect_to restaurants_path
   end
end
