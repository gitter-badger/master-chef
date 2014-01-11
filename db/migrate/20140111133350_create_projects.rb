class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.references :user, null: false
      t.timestamps
    end
    add_index  :projects, :title
    add_index  :projects, :user_id
  end
end
