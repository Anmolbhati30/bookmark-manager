require "sinatra/base"
require "sinatra/reloader"
require "./lib/bookmark"

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    erb :index
  end

  get "/bookmarks/index" do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get "/bookmarks/new" do
    erb :'bookmarks/new'
  end

  post "/bookmarks/add" do
    @url = params[:url]
    Bookmark.create(url: @url)
    redirect "/bookmarks/index"
  end

  run! if app_file == $0
end
