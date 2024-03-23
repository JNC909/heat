# spec/models/member_spec.rb

require 'rails_helper'

RSpec.describe Member, type: :model do
  it "associates with meetings through meetings_members" do
    should have_many(:meetings).through(:meetings_members)
  end
end
