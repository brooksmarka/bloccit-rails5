module UsersHelper

  def user_has_post?
    @user.posts.count >= 1
  end

  def user_has_comments?
    @user.comments.count >=1
  end

  def user_has_favorites?
    @user.favorites.count >=1
  end

end
