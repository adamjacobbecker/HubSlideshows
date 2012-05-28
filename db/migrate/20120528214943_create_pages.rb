class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :page_type
      t.text :content
      t.integer :project_id

      t.timestamps
    end
  end
end
