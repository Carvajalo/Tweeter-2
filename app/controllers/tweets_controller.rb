class TweetsController < ApplicationController
    before_action :authenticate_user!

    def index
        @tweets = Tweet.all
    end

    def show
        @tweet = Tweet.find(params[:id])
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
        @tweet = Tweet.find(params[:id])
        @tweet.destroy
        redirect_to tweets_path, notice: "¡Tweet deleted!:D"
    end

    private

    def tweet_params
        params.require(:tweet).permit(:text)
    end
end
