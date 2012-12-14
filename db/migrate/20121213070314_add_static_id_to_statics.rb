#encoding: utf-8
class AddStaticIdToStatics < ActiveRecord::Migration
  def change
    add_column :statics, :static_id, :int
    add_column :statics, :static_order, :int

    second_level = Static.where("id <> ?", 1)
    second_level.each do |second_level|
      second_level.static_id = 1
      second_level.save
    end

    Static.create(:title => "Музей", :short_url => "museum", :static_order => 0)
    museum = Static.find_by_short_url("museum")
    Static.create(:title => "История", :short_url => "museum-history", :static_id => museum.id)
    Static.create(:title => "Архивы", :short_url => "archives", :static_id => museum.id)
    Static.create(:title => "Блог", :short_url => "blog", :static_id => museum.id)
  end
end
