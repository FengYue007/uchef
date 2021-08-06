class CommentsController < ApplicationController
  before_action :check_user!

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = @restaurant.comments.new(comment_params)
    # @comment.user = current_user
    # @comment.ip_address = 抓ip

    if @comment.save
      # 執行 create.js.erb
      # 不做事
      # redirect_to restaurant_path(@restaurant) # 餐廳的show 標準
      # redirect_to @restaurant # 餐廳的show　簡寫
    else
      render 'restaurants/show'
    end
    # render html: params
  end

  def destroy
  end

  private
  def comment_params
    permited_params = params.require(:comment).permit(:content)
                                              .merge({user: current_user})
    # permited_params = params.require(:comment).permit(:content).merge({user: current_user, ip_address: ....})
    # permited_params = params.require(:comment).permit(:content)
    # permited_params[:user] = current_user
    # return permited_params
  end
end
