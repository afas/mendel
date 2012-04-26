class WelcomeController < ApplicationController
  def index
    @welcome_articles = Article.to_index
    @welcome_albums = Album.to_index
    @welcome_events = Article.find_all_by_category_id(8)
  end
end
