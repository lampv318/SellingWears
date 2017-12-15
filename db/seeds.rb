Category.create! name: 'Dress'
Category.create! name: 'Shirt'


Product.create! code: 'XYZ-1234',
                name: 'Kimono Sleeve Shirt',
                price: 10.80,
                category_id: '2',
                img_url: 'XYZ-1234_Kimono_Sleeve_Shirt.jpg',
                quantity: 100,
                picture: 'XYZ-1234_Kimono_Sleeve_Shirt.jpg',
                description: Faker::Lorem.paragraph

Product.create! code: 'XYZ-1367',
                name: 'Diamond Print Bodycon',
                category_id: '1',
                price: 18.00,
                img_url: 'XYZ-1367_Diamond_Print_Bodycon_Dress.jpg',
                quantity: 100,
                description: Faker::Lorem.paragraph


Product.create! code: 'XYZ-1466',
                name: 'Pleated',
                category_id: '1',
                price: 20.00,
                img_url: 'XYZ-1466_Pleated_Dress.jpg',
                quantity: 100,
                description: Faker::Lorem.paragraph

Product.create! code: 'XYZ-1660',
                name: 'Halter Neck Ponte',
                category_id: '2',
                price: 17.00,
                img_url: 'XYZ-1660_Halter_Neck_Ponte_Dress.jpg',
                quantity: 100,
                description: Faker::Lorem.paragraph

Product.create! code: 'XYZ-1688',
                name: 'Ponte solid',
                category_id: '1',
                price: 20.00,
                img_url: 'XYZ-1688_Ponte_solid_Dress.jpg',
                quantity: 100,
                description: Faker::Lorem.paragraph

Product.create! code: 'XYZ-1736',
                name: 'Rose Printed',
                category_id: '2',
                price: 50.00,
                img_url: 'XYZ-1736_Rose_Printed_Dress.jpg',
                quantity: 100,
                description: Faker::Lorem.paragraph

Product.create! code: 'XYZ-1847',
                name: 'Abstract Print Strappy',
                category_id: '2',
                price: 50.00,
                img_url: 'XYZ-1847_Abstract_Print_Strappy_Dress.jpg',
                quantity: 100,
                description: Faker::Lorem.paragraph

Product.create! code: 'XYZ-1877',
                name: 'Floral Neck Tie',
                category_id: '1',
                price: 50.00,
                img_url: 'XYZ-1877_Floral_Neck_Tie_Dress.jpg',
                quantity: 100,
                description: Faker::Lorem.paragraph

StateOrder.delete_all
StateOrder.create! id: 1, name: "In Progress"
StateOrder.create! id: 2, name: "Placed"
StateOrder.create! id: 3, name: "Shipped"
StateOrder.create! id: 4, name: "Cancelled"

User.create!  name: 'Admin',
              email: 'admin@admin.com',
              password: '1234567',
              password_confirmation: '1234567',
              is_admin: true

10.times do
Comment.create! product_id: '1',
                user_id: '1',
                content: Faker::Lorem.paragraph
end
