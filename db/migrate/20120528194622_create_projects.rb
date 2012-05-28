class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :email
      t.string :key
      t.integer :hub_id

      t.timestamps
    end
  end
end
