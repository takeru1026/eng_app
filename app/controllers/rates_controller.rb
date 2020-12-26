class RatesController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
  end
  
  def create
    @article = Article.find(params[:article_id])
    @rate = Rate.new(rate_params)
    if  @rate.save
        redirect_to @article
    end
  end
  
  def rate_params 
    params.require(:rate).permit(:score, :comment).merge(user_id: current_user.id, article_id: params[:article_id])
  end
end

