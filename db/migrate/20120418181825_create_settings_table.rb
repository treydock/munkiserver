class CreateSettingsTable < ActiveRecord::Migration
  def self.up
    create_table :settings, :force => true do |t|
      t.string  :key
      t.string  :value
      t.string  :context
      t.integer :configurable_id
      t.string  :configurable_type
      t.timestamps
    end
  end

  def self.down
    drop_table :settings
  end
end