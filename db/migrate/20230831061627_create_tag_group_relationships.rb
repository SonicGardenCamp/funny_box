class CreateTagGroupRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :tag_group_relationships do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
