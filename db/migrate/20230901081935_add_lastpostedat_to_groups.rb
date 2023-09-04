class AddLastpostedatToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :last_posted_at, :datetime
  end
end
