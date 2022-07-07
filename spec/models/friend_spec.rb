require 'rails_helper'

RSpec.describe Friend, type: :model do
  it "must have facebook" do
  [
    "some", 
    "another", 
    "heelo"
  ].each do |fn|
  friend = build(:friend, first_name: fn)
  expect(friend.first_name).not_to eql("heelo")
  end
end

end
