class ImageValidator < ActiveModel::Validator
  def validate(image)
    image.errors.add(:image, 'already exists') if image.class.exists?(image_sha1: image.image_sha1)
  end
end