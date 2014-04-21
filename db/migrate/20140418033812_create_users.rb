class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.datetime :birthday
      t.string :email
      t.boolean :role
      t.string :password_digest

      t.timestamps
    end
  end
end
