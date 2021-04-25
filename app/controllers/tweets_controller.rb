class TweetsController < ApplicationController
    before_action :authenticate_user!
    before_action :get_tweet, only: [:show, :destroy]

    def index
        #@tweets = Tweet.where(user_id: current_user.id)
        #@tweets = Tweet.all
        @tweets = current_user.tweets
    end

    def show
    end

    def new
        @tweet = Tweet.new

    end


    # t.text "text"
    # t.string "username"
    # t.integer "user_id"
    def create
        @tweet = Tweet.new(tweet_params)
        @tweet.user_id = current_user.id
        @tweet.username = current_user.username
        if @tweet.save
            redirect_to tweets_path, notice: "¡Tweet posted!:D"
        else
            message_error = " "
            @tweet.errors.full_messages.each do |error|
                message_error = message_error + " " + error
            end

            #flash.alert = "Can't tweet an empty tweet"
            flash.alert = message_error
            render :new
            
        end

      


    end

    def destroy
        @tweet.destroy
        redirect_to tweets_path, notice: "¡Tweet deleted!:D"
    end

    private

    def tweet_params
        params.require(:tweet).permit(:text)
    end

    def get_tweet
        @tweet = Tweet.find(params[:id])
    end

end
