# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
#
## Creating Brand
#
puts "Creating brnads..."
brnad_names = ['McDonald', 'Dominos', 'Nestle', 'Samsung', 'Wipro', 'Ptanjali', 'Motorola', 'Sony', 'Zebronix', 'Levis', 'Ashirwad', 'Medimix', 'Wrangler', 'Nike', 'Srileathers']
brands = []
brnad_names.each do |bn|
  brands << Brand.new(brand_name: bn)
end
Brand.import brands
brand_ids = Brand.all.map(&:id)
puts "Done !!!"
puts "Brand Ids....#{brand_ids}"
puts "---------------------------------------"
#
## Creating Categories
#
puts "Creating categories..."
cat_names = ['Food', 'Personal Care', 'Electronics', 'Clothing', 'Footwear']
cats = []
cat_names.each do |cn|
  cats << Category.new(category_name: cn)
end
Category.import cats
cat_ids = Category.all.map(&:id)
puts "Done !!!"
puts "Category Ids....#{cat_ids}"
puts "---------------------------------------"
prices = [5, 10, 15, 20, 50, 1, 3.6, 99, 999, 147]
pnames = ["Test", "Sample", "Auto"]
#
## Creating products
#
puts "Creating Products..."
prods = []
10.times do |n|
  15.times do |idx|
    prod = Product.new(name: "#{pnames.sample} Product #{(idx+1)}", price: prices.sample, brand_id: brand_ids.sample, category_id: cat_ids.sample)    
    prods << prod
  end
end
Product.import prods
puts "Done !!!"
puts Product.count
puts "---------------------------------------"
#
## uploading pictures
#
puts "uploading pictures...."
#pics = []
idx = 0
Product.all.each do |prod|
  img_path = "/Users/gegdc/Pictures/prod_#{(idx = idx + 1)}.jpeg"
  prod.pictures.new(image: File.open(img_path)).save
  idx = 0 if idx == 15
end
#Picture.import pics
puts "Done !!!"
puts Picture.count
