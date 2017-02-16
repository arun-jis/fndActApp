class Product < ActiveRecord::Base
  
  validates :name, :price, :brand_id, :category_id, presence: true
  validates :name, uniqueness: { scope: [:brand_id, :category_id], message: "Name Can Not be Duplicate for same Brand & Category" }
  has_many :pictures, as: :attachable
  accepts_nested_attributes_for :pictures, allow_destroy: true
  has_many :product_details, dependent: :delete_all
    accepts_nested_attributes_for :product_details, allow_destroy: true
  belongs_to :brand
  belongs_to :category
  
  def self.with_pictures
    includes(:pictures)
  end
  
  def self.details
    includes(:product_details)
  end

end
