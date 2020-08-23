require 'rails_helper'

RSpec.feature "Tag maintenance" do
  scenario "Users can create new tags" do
    visit "/"

    click_link "New Tag"

    fill_in "Name", with: "Groceries"
    fill_in "Description", with: "Supermarket shopping such as Coles or Woolies"
    click_button "Create Tag"

    expect(page).to have_content("Tag created")  
  end
end