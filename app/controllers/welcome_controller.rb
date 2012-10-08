class WelcomeController < ApplicationController
  def index
    @welcome_articles = Article.to_index
    @welcome_albums = Album.to_index
#    @welcome_events = Article.find_all_by_category_id(8).order("id DESC").limit(8)
    @welcome_events = Article.where("category_id = 8").limit(8)
#    @users = User.all.order("created_at DESC")
  end
end
