class SecretsController < ApplicationController
  
  def new
    @secret = Secret.new
    @user = User.find(params[:user_id])
  end
  
  def create
    @secret = Secret.new(secret_params)
    @secret.author_id = current_user.id

    if @secret.save
      render json: @secret
    else
      render :json => @secret.errors.full_messages
    end    
  end
  
  def secret_params
    params.require(:secret).permit(:title, :recipient_id)
  end
  
end
