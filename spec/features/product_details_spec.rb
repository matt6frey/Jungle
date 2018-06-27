require 'rails_helper'

# Run individual test
# bin/rspec spec/features/product_details_spec.rb

RSpec.feature "ProductDetails", type: :feature, js: true do

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
  scenario "Should navigate to page and should product details." do
    #act
    visit root_path
    #Find and Navigate to link
    find(:link, match: :first, href:/\/(products){1}\/[0-9]{0,}/).click

    #debug
    page.save_screenshot('link.png')

    # VERIFY
    expect(page).to have_css 'article.product'
    expect(page).to have_css '.product-review'

  end
end

# require 'rails_helper'

# RSpec.feature "Visitor navigates to home page", type: :feature, js: true do



#   scenario "They see all products" do
#     # ACT
#     visit root_path

#     # DEBUG
#     page.save_screenshot('image.png')
#     puts page.save_screenshot('image.png')

#     # VERIFY
#     expect(page).to have_css 'article.product', count: 10
#   end

# end