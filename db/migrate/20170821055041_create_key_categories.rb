class CreateKeyCategories < ActiveRecord::Migration[5.1]
  def up
    create_table :key_categories do |t|
      t.string :value, null: false
      t.timestamps
    end

    if Key.all.empty?
      change_table :keys do |t|
        t.integer :key_category_id, null: false
      end
    else
      category = KeyCategory.create(value: "Unknown")
      category.save

      change_table :keys do |t|
        t.integer :key_category_id, default: category.id, null: false
      end

      change_column_default :keys, :key_category_id, nil
    end

    add_foreign_key :keys, :key_categories
  end

  def down
    remove_foreign_key :keys, :key_categories
    remove_column :keys, :key_category_id
    drop_table :key_categories
  end
end
