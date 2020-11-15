class ArticlesController < ApplicationController
  
  before_action :authenticate_user!
  before_action :if_not_company_user?, only: :new
  
  
  def index
   @q = Article.ransack(params[:q])
   @articles = @q.result(distinct: true).page(params[:page]).per(10)
  end
  
  def new
    @articles = Article.new
  end

  def create
    @articles = Article.new(article_params)
    @articles.user_id = current_user.id
        if @articles.save!
          redirect_to articles_path
          flash[:success] = "投稿完了しました"
        else
          redirect_to new_article_path
          flash.now[:danger] = "投稿に失敗しました"
        end
  end

  def show
    @articles= Article.find(params[:id])
    @comments = @articles.rates
  end

  def edit
    @articles = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update!(article_params)
    if article.save!
      redirect_to articles_path
      flash[:success] = "更新完了しました。"
    else
      redirect_to  "/articles/#{@articles.id}/edit/"
      flash.now[:danger] = "更新失敗しました。"
    end
  end

  def destroy
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.destroy
      redirect_to articles_path
      flash[:success] = "削除しました"
    end
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :description, :image, :remove_image).merge(user_id:current_user.id)
  end
  def if_not_company_user?
    redirect_to root_path unless current_user.company_user?
  end
end
