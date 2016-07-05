require "spec_helper"
require "rails_helper"

describe Wishlist do
  it {should belong_to(:user)}
end

