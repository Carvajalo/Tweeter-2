module Api
    module V1
      class UsersController < ApiController
              
        def create
              begin
            @user=User.new(user_params)
            if @user.save
              render json: {message: "User created", email: @user.email, status: 200}
            else
                render json: { error:"User already exist.", status: 400 } 
                      end
                  rescue
                      render json: { error:"User already exist.", status: 400 } 
                  end
          end
  
        def login
          @user=User.where(email: params[:email]).first
  
          if @user && @user.valid_password?(params[:password])
            render json: {user: @user} 
          else
            render json: { error: "Email or password incorrect", status: 400 } 
          end
        end
              
  
              private
  
              
              def user_params
                  params.permit(:email,:password)
              end
          end        
      end    
  end