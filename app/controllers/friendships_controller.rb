class FriendshipsController < ApplicationController
  
  def new
    @friendship = Friendship.new
  end
  
  def create
    @friendship = Friendship.new(friendship_params)
    @friendship.out_friend_id = current_user.id
    @friendship.save!
    redirect_to users_url
    #render json: @friendship
  end
  
  
  private
  def friendship_params
    params.require(:friendships).permit(:in_friend_id)
  end
end
