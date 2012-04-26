class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :main_menu

  protected

  def main_menu
    @menu_categories = Category.all
    @menu_statics = Static.all
  end
end
