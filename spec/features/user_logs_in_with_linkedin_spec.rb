require "rails_helper"

RSpec.feature "user logs in with linkedin" do
  let(:stubbed_user_data) do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:linkedin] = OmniAuth::AuthHash.new({
      "provider" => "linkedin",
      "uid" => "AbC123",
      "info" =>  {
        "name" => "John Doe",
        "email" => "john@doe.com",
        "first_name" => "John",
        "last_name" => "Doe"
      },
      "credentials" => {
          "token" => "12312",
          "secret" => "aBc"
     }
    })
  end

  scenario "they are authenicated through linkedin" do
    stubbed_user_data
    visit '/'
    click_link "Log In with LinkedIn"

    expect(current_path).to eq "/john"
    expect(page).to have_content "Log Out"
    expect(page).not_to have_content "Log In with LinkedIn"
  end
end
