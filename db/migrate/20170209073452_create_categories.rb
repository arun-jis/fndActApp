class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category_name, index: true, null: false
      t.string :description      
      t.timestamps null: false
    end
  end
end
