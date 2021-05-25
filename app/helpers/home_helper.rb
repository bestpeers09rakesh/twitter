module HomeHelper
  def following?(followed_user)
    if Current.user
      if Follow.find_by(follower_id:Current.user.id, followed_id:followed_user)
        true
      else
        false
      end
    # else
        # redirect_to new_session_path
    end
  end
  
  def like?(post_id)
    if Current.user
      if Like.find_by(user_id:Current.user.id, post_id:post_id)
        true
      else
        false
      end
    # else
      # redirect_to new_session_path
    end
  end
  
  def like_count(post_id)
    Like.where(post_id:post_id).count
  end 
  
end
