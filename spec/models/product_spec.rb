require "spec_helper"
require "rails_helper"

describe Product do

  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:description)}
  it {should validate_presence_of(:cost)}
  it {should validate_presence_of(:tags)}

  it {should validate_numericality_of(:quantity).is_greater_than(0)}
  it {should validate_numericality_of(:cost).is_greater_than(0)}

  it "searches for a particular product" ,'.search' do
    product = Product.create(name: 'collared-blue',description: 'aaa',cost: '1000',tags: 'shirt,one,norway,simple')
    expect(product.tags).to include "shirt"
  end

  it {should belong_to(:seller)}
  it {should have_many(:ratings)}

end
