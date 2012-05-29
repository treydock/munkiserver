class AddExternalAuthColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :external_auth, :boolean
  end
end
