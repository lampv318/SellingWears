Product.create! code: 'XYZ-1234',
                name: 'Kimono Sleeve Shirt',
                category: 'shirt',
                price: 10.80,
                img_url: 'XYZ-1234_Kimono_Sleeve_Shirt.jpg',
                quantity: 100,
                picture: 'XYZ-1234_Kimono_Sleeve_Shirt.jpg',
                description: Faker::Lorem.paragraph

Product.create! code: 'XYZ-1367',
                name: 'Diamond Print Bodycon',
                category: 'dress',
                price: 18.00,
                img_url: 'XYZ-1367_Diamond_Print_Bodycon_Dress.jpg',
                quantity: 100,
                description: Faker::Lorem.paragraph


Product.create! code: 'XYZ-1466',
                name: 'Pleated',
                category: 'dress',
                price: 20.00,
                img_url: 'XYZ-1466_Pleated_Dress.jpg',
                quantity: 100,
                description: Faker::Lorem.paragraph

Product.create! code: 'XYZ-1660',
                name: 'Halter Neck Ponte',
                category: 'dress',
                price: 17.00,
                img_url: 'XYZ-1660_Halter_Neck_Ponte_Dress.jpg',
                quantity: 100,
                description: Faker::Lorem.paragraph

Product.create! code: 'XYZ-1688',
                name: 'Ponte solid',
                category: 'dress',
                price: 20.00,
                img_url: 'XYZ-1688_Ponte_solid_Dress.jpg',
                quantity: 100,
                description: Faker::Lorem.paragraph

Product.create! code: 'XYZ-1736',
                name: 'Rose Printed',
                category: 'dress',
                price: 50.00,
                img_url: 'XYZ-1736_Rose_Printed_Dress.jpg',
                quantity: 100,
                description: Faker::Lorem.paragraph

Product.create! code: 'XYZ-1847',
                name: 'Abstract Print Strappy',
                category: 'dress',
                price: 50.00,
                img_url: 'XYZ-1847_Abstract_Print_Strappy_Dress.jpg',
                quantity: 100,
                description: Faker::Lorem.paragraph

Product.create! code: 'XYZ-1877',
                name: 'Floral Neck Tie',
                category: 'dress',
                price: 50.00,
                img_url: 'XYZ-1877_Floral_Neck_Tie_Dress.jpg',
                quantity: 100,
                description: Faker::Lorem.paragraph

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
