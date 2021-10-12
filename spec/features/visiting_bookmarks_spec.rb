feature "Viewing bookmarks" do
  scenario "Visiting homepage" do
    visit "/"
    expect(page).to have_content "Bookmark Manager"
  end

  scenario "Visiting /bookmarks homepage" do
    visit "/bookmarks/index"

    some_bookmarks = [
      "http://www.makersacademy.com/",
      "http://www.destroyallsoftware.com/",
      "http://www.google.com/",
    ]

    some_bookmarks.each { |bookmark|
      expect(page).to have_content bookmark
    }
  end
end
