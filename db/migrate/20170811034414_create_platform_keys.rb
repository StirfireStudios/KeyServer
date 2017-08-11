class CreatePlatformKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :platform_keys do |t|

      t.timestamps
    end
  end
end
