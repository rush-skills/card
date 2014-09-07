class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :unid, :string
  end
end
