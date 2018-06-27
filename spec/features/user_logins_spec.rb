require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  # setup
  before :each do

    @user_2 = User.create(
      name: "Matt",
      email: "matt6frey@gmail.com",
      password: "@check",
      password_confirmation: "@check"
    )
  end


  # scenario
  scenario "navigating to login page and using unknown credentials should redirect to login page" do
    # act
    visit root_path
    # Find and Navigate to link
    # click add button and check it out.
    find(:link, match: :first, href:"/login").click

    # puts page.html

    # Sign in
    fill_in 'session_email', with: "notAUser"
    fill_in 'session_password', with: "asdf"
    click_button 'Log in'

    # debug
    page.save_screenshot('redirected.png')
    puts page.save_screenshot('redirected.png')

    # VERIFY
    # Checks for redirection to sign up.
    within('body') { expect(page).to have_content('Login') }
  end

  # scenario
  scenario "navigating to login page and using credentials should, on success, redirect to home" do
    # act
    visit root_path
    # Find and Navigate to link
    # click add button and check it out.
    find(:link, match: :first, href:"/login").click

    # puts page.html

    # Sign in
    fill_in 'session_email', with: @user_2.email
    fill_in 'session_password', with: @user_2.password
    click_button('Log in')

    # debug
    page.save_screenshot('loggedin.png')
    puts page.save_screenshot('loggedin.png')

    # VERIFY
    # Checks for redirection to sign up.
    # within('header.page-header') { expect(page).to have_content('Products') }
    expect(current_path).to eq '/'
  end
end
