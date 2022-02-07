require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before do
      @category=Category.new(id: 1, name: 'Furniture')
      @category.save
    end
        
    it 'should be saved successfully will all four required fields' do 
      @product = Product.new(name: 'Sofa', price_cents: 123.45, quantity: 12, category_id: 1)
      @product.save
      expect(@product.id).to be_present
    end

    it "should include a error if name is missing" do
      @product = Product.new(name: nil, price_cents: 123.45, quantity: 12, category_id: 1)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "should include a error if price_cents is missing" do
      @product = Product.new(name: 'Sofa', quantity: 12, category_id: 1)
      @product.save
      expect(@product.errors.full_messages).to include ("Price can't be blank")
    end

    it "should include a error if quantity is missing" do
      @product = Product.new(name: 'Sofa', price_cents: 123.45, category_id: 1)
      @product.save
      expect(@product.errors.full_messages).to include ("Quantity can't be blank")
    end
    
    it "should include a error if category is missing" do
      @product = Product.new(name: 'Sofa', quantity: 12, price_cents: 123.45)
      @product.save
      expect(@product.errors.full_messages).to include ("Category can't be blank")
    end
  end
end
 
