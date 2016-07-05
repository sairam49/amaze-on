require "spec_helper"
require "rails_helper"

describe User do

  it {should have_many(:orders).dependent(:destroy)}
  it {should have_many(:addresses)}
  it {should have_one(:wishlist)}
  it {should have_one(:rating)}

end
