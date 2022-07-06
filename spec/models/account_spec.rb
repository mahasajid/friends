require 'rails_helper'

RSpec.describe Account, type: :model do
  it "must have a password of length 6 or greater" do
    account = create(:account, email: "hello2@world.com")
    account2 = create(:account, email: "hello1@world.com") #build to not save in test db
    expect(account.password.length).to be >= 6
  end

end
