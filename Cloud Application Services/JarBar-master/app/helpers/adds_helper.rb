module AddsHelper
  
  def add_author(add)
    user_signed_in? && current_user.id == add.user_id
  end
end
