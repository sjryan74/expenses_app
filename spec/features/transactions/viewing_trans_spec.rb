require 'rails_helper'

RSpec.feature "Viewing transactions" do
  let!(:trans) { FactoryBot.create(:transaction, description: "Bank fee", amount: 50) }

  scenario "Users can view transaction detail" do
    visit "/transactions"

    click_link "50.00"

    expect(page).to have_content("Bank fee")  
    expect(page).to have_content("50.00")
  end
end