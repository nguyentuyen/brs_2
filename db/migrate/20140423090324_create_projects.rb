class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :short_name
      t.datetime :start_date
      t.datetime :end_date
      t.integer :id_leader

      t.timestamps
    end
    add_index :projects, :name, unique: true
  end
end
