require 'rails_helper'

RSpec.feature "Users can delete tags from transactions" do
  let(:shopping_tag) { FactoryBot.create(:tag, name: 'Shopping') }
  let(:isp_tag) { FactoryBot.create(:tag, name: 'ISP') }
  let(:food_tag) { FactoryBot.create(:tag, name: 'Food') }
  let(:trans) do
    FactoryBot.create(:transaction, tags: [shopping_tag, isp_tag, food_tag])
  end

  before do
    visit transaction_path(trans)
  end

  scenario "from transactions page", js: true do
    within tag("Shopping") do
      click_link "Remove tag"
    end
    expect(page).to_not have_content("Shopping")
  end
end
