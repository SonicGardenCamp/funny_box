class CreateUserGroupRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :user_group_relationships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
