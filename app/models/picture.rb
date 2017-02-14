class Picture < ActiveRecord::Base
  mount_uploader :image, ImageUploader 
  validates :image, presence: true
  #validates_with ImageValidator
  belongs_to :attachable, polymorphic: true    
  #attr_accessible :image, :attachable_id, :attachable_type
  
  #before_validation(on: :create) do
   # self.image_sha1 = Digest::SHA1.file(image.path).hexdigest
    #self.image_sha1 = Digest::SHA1.new.hexdigest(image.path)
  #end
end
