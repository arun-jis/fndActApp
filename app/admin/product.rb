ActiveAdmin.register Product do
  #
  permit_params :name, :price, :category_id, :brand_id, pictures_attributes: [:id, :image, :attachable_id, :attachable_type, :image_sha1, :_destroy],
                product_details_attributes: [:id, :color, :size, :description, :product_id, :_destroy]
  #belongs_to :brand
  #

  form html: { multipart: true }  do |f|
    f.inputs  do
      f.input :name
      f.input :price
      f.input :brand_id, :as => :select, :collection => Brand.all, :member_label => lambda { |i| i.brand_name }
      f.input :category_id, :as => :select, :collection => Category.all, :member_label => lambda { |i| i.category_name }
      f.has_many :pictures, allow_destroy: true do | pic |
        pic.input :image
      end
      f.has_many :product_details, allow_destroy: true do | pd |
        pd.input :size
        pd.input :color
        pd.input :description                
      end      
    end
    f.actions
  end
  
  index do
    column :image do |pic|
      image_tag pic.pictures.first.image.url(:thumb) if pic.pictures.count > 0
    end
    column :name
    column :price
    column :brand do |obj|
      obj.brand.brand_name
    end
    column :category do |obj|
      obj.category.category_name
    end    
    actions
  end  
   
  show do
    attributes_table do
      row :name
      row :price
    end
    panel "Pictures" do
      render partial: 'admins/prod_details', locals: { prod: product }
    end    
  end
  
  controller do
    #autocomplete :brand, :brand_name
  end
  filter :name, as: :select
  filter :brand, :as => :select, :collection => Brand.all, :member_label => lambda { |i| i.brand_name }
  filter :category, :as => :select, :collection => Category.all, :member_label => lambda { |i| i.category_name }
end
