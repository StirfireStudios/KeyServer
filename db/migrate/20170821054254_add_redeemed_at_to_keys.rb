class AddRedeemedAtToKeys < ActiveRecord::Migration[5.1]
  def change
    change_table :keys do |t|
      t.datetime :redeemed_at
    end
  end
end
