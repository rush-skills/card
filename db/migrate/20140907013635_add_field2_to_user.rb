class AddField2ToUser < ActiveRecord::Migration
  def change
    add_column :users, :website, :string
    add_column :users, :dob, :date
    add_column :users, :bio, :text
    add_column :users, :location, :string
    add_column :users, :pic, :string
    add_column :users, :github, :string
    add_column :users, :gplus, :string
    add_column :users, :linkedin, :string
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
  end
end
