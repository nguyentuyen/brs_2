class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :short_name
      t.string :id_leader
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
