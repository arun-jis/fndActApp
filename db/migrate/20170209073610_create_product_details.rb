class CreateProductDetails < ActiveRecord::Migration
  def change
    create_table :product_details do |t|
      t.belongs_to :product, index: :true, null: false
      t.string :description
      t.string :color
      t.string :size
      t.timestamps null: false
    end
  end
end
