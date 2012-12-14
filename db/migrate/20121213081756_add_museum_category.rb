#encoding: utf-8
class AddMuseumCategory < ActiveRecord::Migration
  def change
    Category.create(:title => "Музей", :short_url => "museum-blog")
  end
end
