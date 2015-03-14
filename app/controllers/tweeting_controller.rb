class TweetingController < ApplicationController
  require 'twitter'

# NOT SURE WHAT THIS POST METHOD IS YET
  # def post
  #   @post = Tweet.new(params[:post])
  #   current_user.update "Tweet"
  #   @tweeting = Tweet.new
  # end

  def new
    @tweet = Tweet.new

    respond_to do |format|
      format.html {render :index}
      format.json { render json: @tweet}
    end
  end

  def create
    current_user.tweet(params[:message])
  end

  def twitter_params
    params.require(:tweet).permit(:mesage)
  end
end

