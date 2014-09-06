class AddFields1ToUser < ActiveRecord::Migration
  def change
    add_column :users, :contact_number, :string
    add_column :users, :address, :text
    add_column :users, :job_title, :string
    add_column :users, :job_company, :string
    add_column :users, :education_degree, :string
    add_column :users, :education_college, :string
  end
end
