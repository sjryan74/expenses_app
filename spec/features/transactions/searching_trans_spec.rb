require 'rails_helper'

RSpec.feature "Users can search for transactions" do
  let!(:transaction_1) do
    FactoryBot.create(:transaction, description: "Coles supermarket",
      tags: [ FactoryBot.create(:tag, name: "groceries") ])
  end

  let!(:transaction_2) do
    FactoryBot.create(:transaction, description: "Internet Service Fee",
      tags: [ FactoryBot.create(:tag, name: "isp") ])
  end

  before do
    visit transactions_path
  end

  scenario "search by tag" do
    fill_in "Search", with: %q{tag:"groceries"}
    click_button "Search"

    expect(page).to have_content(transaction_1.description)
    expect(page).to_not have_content(transaction_2.description)
  end
end
