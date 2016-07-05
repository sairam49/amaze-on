require "spec_helper"
require "rails_helper"

describe Address do

  it {should belong_to(:user)}

  it {should validate_presence_of(:house_number)}
  it {should validate_presence_of(:city)}
  it {should validate_presence_of(:street)}
  it {should validate_presence_of(:state)}
  it {should validate_presence_of(:pincode)}
  it {should validate_presence_of(:phone_number)}

  it {should validate_length_of(:phone_number)}

end
