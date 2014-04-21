class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :name
      t.string :short_name

      t.timestamps
    end
    add_index :name, :short_name, unique: true
  end
end
