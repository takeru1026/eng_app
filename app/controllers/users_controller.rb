class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @article = @user.articles
    likes = Like.where(user_id: current_user.id).pluck(:article_id)  # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    @like_list = Article.find(likes)     # postsテーブルから、お気に入り登録済みのレコードを取得
  end
end
