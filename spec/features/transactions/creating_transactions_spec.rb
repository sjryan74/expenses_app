require 'rails_helper'

RSpec.feature "Create transactions" do
  scenario "Users can create new transactions" do
    visit "/transactions"

    click_link "New Transaction"

    fill_in "Trans Date", with: Time.now
    fill_in "Amount", with: 20.6
    fill_in "Description", with: "Netflix payment"
    click_button "Create Transaction"

    expect(page).to have_content("Transaction created")  
    expect(page).to have_content("Netflix payment")
    expect(page).to have_content("20.60")
  end

  scenario "with tags" do
    # a comment
    visit "/transactions"

    click_link "New Transaction"

    fill_in "Trans Date", with: Time.now
    fill_in "Amount", with: 20.6
    fill_in "Description", with: "Bill payment"
    fill_in "Tags", with: "utility,gas"
    click_button "Create Transaction"

    expect(page).to have_content("Transaction created")  
    expect(page).to have_content("Bill payment")
    expect(page).to have_content("20.60")
    expect(page).to have_content("gas")
    expect(page).to have_content("utility")
  end
end