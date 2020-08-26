require 'rails_helper'

RSpec.feature "Users can delete tags" do
  before do
    FactoryBot.create(:tag, name: "TheTag", description: "TheDescription")
    visit "/"

    click_link "TheTag"
  end

  scenario "with valid attributes" do
    click_link "Delete"

    expect(page).to have_content "Tag deleted"
    expect(page).to_not have_content "TheTag"
    expect(page).to_not have_content "TheDescription"
  end
end
