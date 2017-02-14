class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :image
      t.integer :attachable_id
      t.string :attachable_type
      t.timestamps null: false
    end
  end
end
