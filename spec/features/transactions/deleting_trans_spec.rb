require 'rails_helper'

RSpec.feature "Users can delete transactions" do
  before do
    FactoryBot.create(:transaction, description: "Bank fee", amount: 50)
    visit '/transactions'

    click_link "50.00"
  end

  scenario "with valid attributes" do
    click_link "Delete"

    expect(page).to have_content("Transaction deleted")  
    expect(page).to_not have_content("Bank fee")  
  end
end