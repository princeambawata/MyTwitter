class HomeController < ApplicationController
  before_action :authenticate_user! 

  def index
  	@tweets = Tweet.all.order(created_at: :desc)
  end

  def profile
    @user = User.find_by_id(params["id"]);
  end

  def tweet
    @tweet = current_user.tweets.create(tweet_params)
    respond_to do |format| 
      if @tweet.save
      format.js{}
      end 
    end
  end

  def like
  	@tweet_id = params["tweet_id"]
    like = current_user.likes.where(tweet_id: @tweet_id).first
    if like
    	like.destroy
    else
    	@like = current_user.likes.create(tweet_id: params["tweet_id"])
    end
    respond_to do |format| 
      format.js{}
    end
  end

  def tweet_params
    params.require(:tweet).permit(:tweet , :image)
  end

end
