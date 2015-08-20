class Api::UsersController < ApiController

  before_action :authenticated?, except: :create
  
   
  def create
     user = User.new(user_params)
     if user.save
       render json: user
     else
       render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
     end
  end

  def index
   # return permission_denied_error unless conditions_met
    users = User.all
    render json: users, each_serializer: UserSerializer 
  end

  def conditions_met
    true # We're not calling this an InsecureUserSerializer for nothing
  end

  private
   def user_params
     params.require(:user).permit(:email, :password)
   end

 end