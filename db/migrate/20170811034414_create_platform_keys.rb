class CreatePlatformKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :platform_keys do |t|
      t.string :value
      t.integer :platform_id
      t.integer :game_id
      t.uuid :key_id
      t.timestamps
    end

    add_foreign_key :platform_keys, :keys
    add_foreign_key :platform_keys, :platforms
    add_foreign_key :platform_keys, :games
  end
end
