require "rails_helper"

RSpec.feature "user logs in with linkedin" do
  let(:stubbed_user_data) do
    OmniAuth.config.mock_auth[:linkedin] =
    {
      "some user information, not sure of the format"
    }
  end

  scenario "they are authenicated through linkedin" do
    visit root_path
    click_link "Log In with LinkedIn"
    stubbed_user_data
    
    expect(current_path).to eq root_path
    expect(page).to have_content "username"
    expect(page).to have_content "Log Out"
    expect(page).not_to have_content "Log In with LinkedIn"
  end
end
