require 'rails_helper'

RSpec.describe Product, type: :model do

  context 'Validations:' do
  it 'should save a valid product' do
      @category = Category.create(name:"Business")
      product = Product.new(
        name: "Tie",
        price: 34.00,
        quantity: 15,
        category_id: @category.id
        )
      expect(product).to (be_valid)
    end

    it 'Ensures Name Presence' do
      @category = Category.new(name: "Cats")
      @product = Product.new(price_cents: 10000, quantity: 3, image: '/cats/cat.jpg', category_id: @category.id).save
      expect(@product).to eq(false)
    end

    it 'should not save without valid price' do
      @category = Category.create(name: "Super Hero Accessories")
      price = Product.new(
        name: "Cape",
        price: nil,
        quantity: 15,
        category_id: @category.id
        )
      expect(price).to_not (be_valid)
    end

    it 'should not save without valid quantity' do
      @category = Category.create(name: "Furniture")
      quantity = Product.new(
        name: "King size Bed",
        price: 34.00,
        quantity: nil,
        category_id: @category.id
        )
      expect(quantity).to_not (be_valid)
    end

    it 'should not save without valid category id' do
      @category = Category.create(name: "Special")
      category_id = Product.new(
        name: nil,
        price: 34.00,
        quantity: 15,
        category_id: nil
        )
      expect(category_id).to_not (be_valid)
    end
  end
end
