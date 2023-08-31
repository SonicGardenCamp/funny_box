module GroupsHelper
  
  def button_text(group)
      group.users.include?(current_user) ? [ "退出する", "btn-danger"] : [ "参加する", "btn-primary" ]
  end
end
