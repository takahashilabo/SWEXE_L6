class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end
  
  def create
    user = User.find_by(uid: session[:login_uid])
    @tweet = Tweet.new(message: params[:tweet][:message], user_id:user.id)
    if @tweet.save
      flash[:info] = "ツイートを追加しました"
      redirect_to tweets_path
    else
      render :new
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    flash[:info] = "ツイートを削除しました"
    redirect_to tweets_path
  end
end
