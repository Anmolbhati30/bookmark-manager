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

    visit "/bookmarks/index"

    some_bookmarks.each { |bookmark|
      expect(page).to have_content bookmark
    }
  end
end
