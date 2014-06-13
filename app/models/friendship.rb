class Friendship < ActiveRecord::Base
  validates :out_friend_id, :in_friend_id, presence: true
  
  belongs_to :out_friend, class_name: "User", foreign_key: :out_friend_id
  belongs_to :in_friend, class_name: "User", foreign_key: :in_friend_id
  
  def self.can_friend?(out_friend_id, in_friend_id)
    if out_friend_id == in_friend_id
      return false
    end
    
    if self.exists?(:out_friend_id => out_friend_id, :in_friend_id => in_friend_id)
      return false
    end
    
    return true
  end
  
  def self.can_unfriend?(out_friend_id, in_friend_id)
  
    if self.exists?(:out_friend_id => out_friend_id, :in_friend_id => in_friend_id)
      return true
    end
    
    return false
  end
  
  def self.friendship_id(out_friend_id, in_friend_id)
    friend = self.where(["out_friend_id = ? and in_friend_id = ?",
                      out_friend_id, in_friend_id]).first
    if friend          
      return friend.id
    end
  end
  
  
end
