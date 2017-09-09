module UsersHelper

  def member_since(user)
    user.created_at.strftime("%b %d, %Y")
  end

end
