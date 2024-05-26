class AddDeviseToUsers < ActiveRecord::Migration[7.1]
  def self.up
    change_table :users do |t|
      t.string :email,              null: false, default: "", index: { unique: true }
      t.string :encrypted_password, null: false, default: ""
      t.string :unlock_token
      t.datetime :locked_at
    end

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
