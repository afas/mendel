class WelcomeController < ApplicationController
  def index
    @welcome_articles = Article.to_index
    @welcome_exhibits = Exhibit.to_index
    @welcome_events = Article.where("category_id = 8").limit(8)
    @welcome_companies = Company.to_index
    @welcome_albums = Album.to_index
    @welcome_users = User.order("id DESC").limit(13)
  end
end
