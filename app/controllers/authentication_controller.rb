# class AuthenticationController < ApplicationController
#     skip_before_action :authenticate_request

#     def login 
#         @user = User.find_by_username(params[:username])
#         if @user&.authenticate(params[:password])
#             token = jwt_encode(user_id: @user.id)
#             render json: { token: token }, status: :ok
#         else 
#             render json: { error: "unauthorized" }, status: :unauthorized
#         end
#     end

#     def login_without_pass
#         payload = jwt_decode(params[:token])
        
#     end
#     end
# end
