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


Product.create! name: 'Dress-XYZ', category_id: '1', price: 10.80, description: Faker::Lorem.paragraph

Product.create! name: 'Pants-ZYX', category_id: '2', price: 18.00, description: Faker::Lorem.paragraph

Product.create! name: 'Shirt-ABC', category_id: '3', price: 20.00, description: Faker::Lorem.paragraph

Product.create! name: 'Vest-MMM', category_id: '4', price: 17.00, description: Faker::Lorem.paragraph

Product.create! name: 'Kimono_Sleeve_Shirt', category_id: '1', price: 17.00, description: Faker::Lorem.paragraph

Product.create! name: 'Diamond_Print_Bodycon_Dress', category_id: '1', price: 17.00, description: Faker::Lorem.paragraph

Product.create! name: 'Pleated_Dress', category_id: '1', price: 17.00, description: Faker::Lorem.paragraph

Product.create! name: 'Halter_Neck_Ponte_Dress', category_id: '1', price: 17.00, description: Faker::Lorem.paragraph

Product.create! name: 'Ponte solid', category_id: '1', price: 20.00, description: Faker::Lorem.paragraph

Product.create! name: 'Rose Printed', category_id: '1', price: 50.00, description: Faker::Lorem.paragraph

Product.create! name: 'Abstract Print Strappy', category_id: '1', price: 50.00, description: Faker::Lorem.paragraph

Product.create! name: 'Floral Neck Tie', category_id: '1', price: 50.00, description: Faker::Lorem.paragraph



10.times do |n|
Comment.create! product_id: '1',
                user_id: '1',
                content: Faker::Lorem.paragraph
end
