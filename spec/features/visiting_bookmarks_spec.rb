feature "Viewing bookmarks" do
  scenario "Visiting homepage" do
    visit "/"
    expect(page).to have_content "Bookmark Manager"
  end

  scenario "Visiting /bookmarks homepage" do
    connection = PG.connect(dbname: "bookmark_manager_test")

    # Add the test data
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    test_bookmarks = Bookmark.all

    visit "/bookmarks/index"

    test_bookmarks.each { |bookmark|
      expect(page).to have_content bookmark
    }
  end

  scenario "Adding new bookmark" do
    visit "bookmarks/index"

    click_button "Create new bookmark"

    # Have a form to add details about the bookmark
    youtube_url = "http://www.youtube.com/"

    fill_in :url, with: youtube_url
    click_button "Add"

    # Redirect us back to all bookmarks
    expect(page).to have_content youtube_url
  end
end
