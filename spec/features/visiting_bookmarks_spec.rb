feature "Viewing bookmarks" do
  scenario "Visiting homepage" do
    visit "/"
    expect(page).to have_content "Bookmark Manager"
  end
end
