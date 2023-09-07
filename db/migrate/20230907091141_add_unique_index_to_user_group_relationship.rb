class AddUniqueIndexToUserGroupRelationship < ActiveRecord::Migration[7.0]
  def change
    add_index :user_group_relationships , [:user_id, :group_id], unique: true
    add_index :tag_group_relationships , [:tag_id, :group_id], unique: true
  end
end
