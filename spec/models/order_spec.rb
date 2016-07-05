require "spec_helper"
require "rails_helper"

describe Order do

  it { should validate_presence_of(:user_id) }
  it { should belong_to(:user)}
  it { should have_many(:order_items)}
end
