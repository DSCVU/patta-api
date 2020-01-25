class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.datetime :email_confirmed_at
      t.boolean :admin, default: false

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :admin
  end
end
