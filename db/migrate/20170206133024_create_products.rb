class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, index: true, null: false
      t.float :price, index: true, null: false
      t.belongs_to :brand, index: true, null: false
      t.belongs_to :category, index: true, null: false
      t.timestamps null: false
    end
  end
end
