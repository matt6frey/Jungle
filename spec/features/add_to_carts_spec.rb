require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

   # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
    @products = []
    10.times do |n|
      @products.push(@category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      ))
    end
  end

  #scenario
  scenario "Clicking on 'Add to cart' should add item to cart" do
    #act
    visit root_path

    #Find and Navigate to link
    # click add button and check it out.
    find(:link, match: :first, href:"/cart/add_item?product_id=1").click

    #debug
    page.save_screenshot('add-item.png')

    # VERIFY
    #Checks to see if item is added.
    within('a[href="/cart"]') { expect(page).to_not have_content('(0)') }
  end
end
