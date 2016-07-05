require "spec_helper"
require "rails_helper"

describe Rating do

  it {should validate_presence_of(:user_id)}
  it {should validate_presence_of(:product_id)}
  it {should validate_presence_of(:rating)}
  it {should validate_presence_of(:review)}
  it {should validate_numericality_of(:rating).is_greater_than(0)}

  it {should belong_to(:user)}
  it {should belong_to(:product)}

end
