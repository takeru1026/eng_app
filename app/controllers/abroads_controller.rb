class AbroadsController < ApplicationController
  
  before_action :authenticate_user!, only: :show
  
  
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to abroads_index_path
    else
      render :new
    end
  end

  def show
   
    @user = User.find(params[:id])
    @article = @user.articles
    likes = Like.where(user_id: current_user.id).pluck(:article_id)  # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    @like_list = Article.find(likes) 
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    @rooms = @user.rooms
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
end
