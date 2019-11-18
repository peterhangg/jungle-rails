require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    category = Category.create(name: 'YSL')
    product = Product.new(name: 'jacket', price_cents:100, quantity: 1, category: category)

    it "is valid with valid attributes" do
      expect(product).to be_valid
    end

    it "is not valid without a name" do
      # category = Category.create(name: 'YSL')
      # product = Product.new(name: nil, price:100, quantity: 1, category: category)
      product.name = nil
      product.save
      expect(product.errors.full_messages).to include("Name can't be blank")
      expect(product).to_not be_valid
    end

    it "is not valid without a price" do
      #   category = Category.create(name: 'YSL')
      #   product = Product.new(name: "jacket", price_cents: nil, quantity: 1, category: category)
      product.price_cents = nil
      product.save
      expect(product.errors.full_messages).to include("Price can't be blank")
      expect(product).to_not be_valid
    end
    
    it "is not valid without a quantity" do 
      #   category = Category.create(name: 'YSL')
      #   product = Product.new(name: "jacket", price: 100, quantity: nil, category: category)
      product.quantity = nil
      product.save
      expect(product.errors.full_messages).to include("Quantity can't be blank")
      expect(product).to_not be_valid
    end 

    it "is not valid without a category" do
      #   category = Category.create(name: 'YSL')
      #   product = Product.new(name: "jacket", price: 100, quantity: 1, category: nil)
      product.category = nil
      product.save
      expect(product.errors.full_messages).to include("Category can't be blank")
      expect(product).to_not be_valid
    end

  end
end
