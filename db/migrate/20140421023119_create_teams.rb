	class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :description
      t.integer :id_leader

      t.timestamps
    end
  end
end
