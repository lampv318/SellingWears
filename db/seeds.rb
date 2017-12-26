User.create!  name: 'Admin',
email: 'admin@admin.com',
password: '1234567',
password_confirmation: '1234567',
is_admin: true

User.create!  name: 'shipper',
email: 'shipper@shipper.com',
password: '1234567',
password_confirmation: '1234567',
shipper: true


99.times do |n|
  name  = Faker::Name.name
  email = "user-#{n + 1}@user.com"
  password = '123456'
  User.create!  name:  name,
  email: email,
  password: password,
  password_confirmation: password
end


Category.create! name: 'Dress'
Category.create! name: 'Pants'
Category.create! name: 'Shirt'
Category.create! name: 'Vest'


StateOrder.delete_all
StateOrder.create! id: 1, name: "In Progress !"
StateOrder.create! id: 2, name: "Processing ...... !"
StateOrder.create! id: 3, name: "Delivering..."
StateOrder.create! id: 4, name: "Completed !"
StateOrder.create! id: 5, name: "Cancelled !"
StateOrder.create! id: 6, name: "Wait admin agree ......!"


9.times do |n|
  Product.create! name: "Dress " + Faker::Commerce.product_name, category_id: '1', price: Faker::Commerce.price, description: Faker::Lorem.paragraph, img_url: "https://raw.githubusercontent.com/Thientran2910/SellingWears/master/collections/#{n+1}.jpg"
end

9.times do |n|
  Product.create! name: "Pants " + Faker::Commerce.product_name, category_id: '2', price: Faker::Commerce.price, description: Faker::Lorem.paragraph, img_url: "https://raw.githubusercontent.com/Thientran2910/SellingWears/master/collections/#{n+1}.jpg"

end

9.times do |n|
  Product.create! name: "Shirt " + Faker::Commerce.product_name, category_id: '3', price: Faker::Commerce.price, description: Faker::Lorem.paragraph, img_url: "https://raw.githubusercontent.com/Thientran2910/SellingWears/master/collections/#{n+1}.jpg"
end

9.times do |n|
  Product.create! name: "Vest " + Faker::Commerce.product_name, category_id: '4', price: Faker::Commerce.price, description: Faker::Lorem.paragraph, img_url: "https://raw.githubusercontent.com/Thientran2910/SellingWears/master/collections/#{n+1}.jpg"
end




10.times do |n|
  Comment.create! product_id: '1',
  user_id: '1',
  content: Faker::Lorem.paragraph
end
