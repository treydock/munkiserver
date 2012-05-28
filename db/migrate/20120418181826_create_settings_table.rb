class CreateSettingsTable < ActiveRecord::Migration
  def change
    create_table :settings, :force => true do |t|
      t.string  :name
      t.text    :value
      t.integer :category_id
      t.string  :input_type
      t.text    :options
      t.timestamps
    end
    add_index :settings, [:name,:category_id], :unique => true
  end
end