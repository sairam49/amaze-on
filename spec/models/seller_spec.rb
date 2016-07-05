require "spec_helper"
require "rails_helper"

describe Seller do

  it {should have_many(:products)}
  it {should have_many(:order_items)}

end
