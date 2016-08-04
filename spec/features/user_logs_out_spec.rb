require "rails_helper"

RSpec.feature "user logs out" do
  fixtures :users
  scenario "by clicking Log Out" do
    user = users(:erin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)
    click_link "Log Out"

    expect(current_path).to eq root_path
    expect(page).to have_content("Log In with LinkedIn")
    expect(page).not_to have_content("Log Out")
  end
end
