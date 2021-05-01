module Api 
    module V1
        class ApiController < ActionController::Base
            #Skip validation of crsf token
            skip_before_action :verify_authenticity_token
            before_action :configure_permitted_parameters, if: :devise_controller?
            before_action :basic_auth


            rescue_from ActiveRecord::RecordNotFound, with: :render_404
            rescue_from ActionController::RoutingError, with: :render_404
            rescue_from ActionController::InvalidAuthenticityToken, with: :render_404

            
            #GET :3000/api/v1/tweets/:id -a gmail@gmail.com:password
            def basic_auth
                #params[:name, :username, :email, :password, #:confirmationpassword#]
                authenticate_with_http_basic do |email, user_token|
                    user = User.authenticate(email, user_token)
                    unless user.empty?
                        #byebug
                        @current_user = User.find_by_email(email)
                    else
                        head :unauthorized
                    end
                end
            end

            def current_user
                @current_user
            end


            def render_404
                render json: { error: "Tweet not found", status: 404 }
            end

            protected
            def configure_permitted_parameters
                devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name])
            end

        end
    end
end



