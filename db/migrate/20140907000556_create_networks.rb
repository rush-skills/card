class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.integer :from
      t.integer :to

      t.timestamps
    end
  end
end
