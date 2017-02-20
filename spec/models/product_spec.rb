require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @product = Product.new
  end

  describe 'initialized in before(:each)' do
    it "should not have all nil fields" do
      @product.name = nil
      @product.quantity = nil
      @product.price = nil
      @product.category = nil
      expect(@product.save).not_to be_truthy
    end

    it "should not only have name" do
      @product.name = "Banana"
      @product.quantity = nil
      @product.price = nil
      @product.category = nil
      expect(@product.save).not_to be_truthy
    end


    it "should not only have name/quantity" do
      @product.name = "Banana"
      @product.quantity = 1
      @product.price = nil
      @product.category = nil
      expect(@product.save).not_to be_truthy
    end

    it "should not only have name/quantity/price" do
      @product.name = "Banana"
      @product.quantity = 1
      @product.price = "1.99"
      @product.category = nil
      expect(@product.save).not_to be_truthy
    end

    it 'should have 4 categories' do
      @product.name = "Banana"
      @product.quantity = 1
      @product.price = "1.99"
      @category = Category.new(name: "Fruit")
      @product.category = @category
      expect(@product.save).to be_truthy
    end
  end
   
  #pending "add some examples to (or delete) #{__FILE__}"
end

# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true
