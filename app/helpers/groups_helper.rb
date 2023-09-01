module GroupsHelper
  
  def button_text(group)
    if group.host_user_id == current_user.id
      return ["ホスト", "btn-light disabled"]
    else
      group.users.include?(current_user) ? [ "退会する", "btn-danger"] : [ "参加する", "btn-primary" ]
    end
  end
end
