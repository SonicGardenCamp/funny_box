module GroupsHelper
  
  def button_text(group)
    group.users.include?(current_user) ? "退出する" : "参加する"
  end
end
