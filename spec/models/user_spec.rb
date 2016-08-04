require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :users
  it { should have_one :profile_summary }

  it "overrides the param method with the user's first name" do
    user = users(:weirdo)
    expect(user.to_param).to eq "w-eirdo"
  end
end
