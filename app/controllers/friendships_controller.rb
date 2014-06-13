class FriendshipsController < ApplicationController
  
  def create
    @friendship = Friendship.new
    @friendship.in_friend_id = params[:user_id]
    @friendship.out_friend_id = current_user.id
    @friendship.save! 
    render json: @friendship
  end
  
  def destroy
    current_user.out_friendships.where(in_friend_id: params[:user_id]).first!.destroy

    head :ok
  end
  
end
