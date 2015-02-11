class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :null => false
      t.string :name
      t.string :title
      t.string :phone
      t.integer :role, :null => false
      t.integer :hospital_id
      t.boolean :can_login,      :default => true
      t.boolean :must_change_pw, :default => false
      t.boolean :archived,       :default => false
      # devise fields
      t.string :encrypted_password, :null => false
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      t.timestamps
    end

    add_index :users, :name
    add_index :users, :hospital_id
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
