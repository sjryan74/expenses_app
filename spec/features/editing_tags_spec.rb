require 'rails_helper'

RSpec.feature "Users can edit existing tags" do
  before do
    FactoryBot.create(:tag, name: "TheTag", description: "Update me")
    visit "/"

    click_link "TheTag"
    click_link "Edit"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "TheUpdatedTag"
    fill_in "Description", with: "Updated Description"
    click_button "Update Tag"

    expect(page).to have_content "Tag updated"
    expect(page).to have_content "TheUpdatedTag"
    expect(page).to have_content "Updated Description"
  end
end
