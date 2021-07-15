class RestaurantsController < ApplicationController
  # repo:https://stackoverflow.com/questions/3364492/actioncontrollerinvalidauthenticitytoken
  # skip_before_action :verify_authenticity_token

  def index
  end

 def new
 end

 def list
   # render html: "Title is #{params[:title]}
   render html: "Title is #{params[:title]}、#{params[:tel]}、#{params[:address]}、#{params[:description]}"
 end
end
