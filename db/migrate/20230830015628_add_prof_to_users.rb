class AddProfToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :profile, :text
    add_column :users, :college, :string
  end
end
