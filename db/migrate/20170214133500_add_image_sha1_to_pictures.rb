class AddImageSha1ToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :image_sha1, :string
  end
end
