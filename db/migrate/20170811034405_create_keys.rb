class CreateKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :keys, id: :uuid do |t|
      t.integer :game_id, null: false
      t.timestamps
    end

    add_foreign_key :keys, :games
  end
end
