class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def new
    @articles = Article.new
  end

  def create
    @articles = Article.new(articles_params)
        if @articles.save!
          redirect_to articles_path
        else
          redirect_to new_article_path
        end
  end

  def show
    @articles= Article.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  def articles_params
    params.require(:article).permit(:title, :description).merge(user_id:current_usrer.id)
  end
end
