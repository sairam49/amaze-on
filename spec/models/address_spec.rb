require "spec_helper"
require "rails_helper"

describe Address do

  it {should belong_to(:user)}

end
