class AddDeviseToUsers < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|
      ## Rememberable
      t.datetime :remember_created_at
      
      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

    end

    ## Change password column to one used by Devise
    rename_column :users, :hashed_password, :encrypted_password
    change_column :users, :encrypted_password, :string, :null => false, :default => "", :limit => 128

    add_index :users, :username,                :unique => true
  end

  def self.down
    remove_column :users, :remember_created_at

    remove_column :users, :sign_in_count
    remove_column :users, :current_sign_in_at
    remove_column :users, :last_sign_in_at
    remove_column :users, :current_sign_in_ip
    remove_column :users, :last_sign_in_ip

    rename_column :users, :encrypted_password, :hashed_password
    change_column :users, :hashed_password, :string

    remove_index :users, :column => :username
  end
end
