require 'rails_helper'

RSpec.feature "Users can edit transactions" do
  before do
    FactoryBot.create(:transaction, description: "Bank fee", amount: 50)
    visit '/transactions'

    click_link "50.00"
    click_link "Edit"
  end

  scenario "with valid attributes" do
    fill_in "Trans Date", with: "08/08/2020"
    fill_in "Description", with: "Account fee"
    fill_in "Amount",	with: "23.50"
    click_button "Update Transaction"

    expect(page).to have_content("Transaction updated")  
    expect(page).to have_content("2020-08-08")
    expect(page).to have_content("Account fee")  
    expect(page).to have_content("23.50")
  end
end