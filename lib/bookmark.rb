require "pg"

class Bookmark
  @@connection

  def self.all
    self.establish_connection

    result = connection.exec("SELECT * FROM bookmarks;")

    result.map { |bookmark_row| bookmark_row["url"] }
  end

  def self.create(url:)
    self.establish_connection

    connection.exec("INSERT INTO bookmarks(url) VALUES('#{url}');")
  end

  private

  def self.connection
    @@connection
  end

  def self.establish_connection
    if ENV["ENVIRONMENT"] == "test"
      @@connection = PG.connect(dbname: "bookmark_manager_test")
    else
      @@connection = PG.connect(dbname: "bookmark_manager")
    end
  end
end
