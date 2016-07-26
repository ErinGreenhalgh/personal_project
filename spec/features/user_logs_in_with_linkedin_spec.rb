require "rails_helper"

RSpec.feature "user logs in with linkedin" do
  let(:stubbed_user_data) do
    OmniAuth.config.mock_auth[:linkedin] = {
      "provider"=>"linkedin",
      "uid"=>"AbC123",
      "info"=> {
        "name"=>"John Doe",
        "email"=>"john@doe.com",
        "nickname"=>"John Doe",
        "first_name"=>"John",
        "last_name"=>"Doe",
        "location"=>"Greater Boston Area, US",
        "description"=>"Senior Developer, Hammertech",
        "image"=> "http://m.c.lnkd.licdn.com/mpr/mprx/0_aBcD...",
        "phone"=>"null",
        "headline"=> "Senior Developer, Hammertech",
        "industry"=>"Internet",
        "urls"=>{"public_profile"=>"http://www.linkedin.com/in/johndoe"}
      },
        "credentials"=> {
          "token"=>"12312",
          "secret"=>"aBc"
        }
    }
  end

  scenario "they are authenicated through linkedin" do
    visit '/'
    click_link "Log In with LinkedIn"
    stubbed_user_data

    expect(current_path).to eq root_path
    expect(page).to have_content "username"
    expect(page).to have_content "Log Out"
    expect(page).not_to have_content "Log In with LinkedIn"
  end
end
