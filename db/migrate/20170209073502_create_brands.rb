class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :brand_name, index: true, null: false
      t.string :description
      t.timestamps null: false
    end
  end
end
