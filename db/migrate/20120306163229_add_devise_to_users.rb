class AddDeviseToUsers < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|
      # Emulate database_authentication as we already have email field
#      t.string :encrypted_password, :null => false, :default => "", :limit => 128
      t.rememberable
      t.trackable

      # t.database_authenticatable :null => false
      # t.recoverable
      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps
    end

    rename_column :users, :hashed_password, :encrypted_password
    change_column :users, :encrypted_password, :string, :null => false, :default => "", :limit => 128

    add_index :users, :username,                :unique => true
    # add_index :users, :email,                :unique => true
    # add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    #raise ActiveRecord::IrreversibleMigration
  end
end
