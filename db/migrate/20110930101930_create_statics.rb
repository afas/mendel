# encoding: utf-8
class CreateStatics < ActiveRecord::Migration
  def self.up
    create_table :statics do |t|
      t.string :title
      t.string :short_url
      t.text :content

      t.timestamps
    end

    Static.create( :title => "О проекте", :short_url => "about")
    Static.create( :title => "История", :short_url => "history")
    Static.create( :title => "Архив", :short_url => "archive")
    Static.create( :title => "Контакты", :short_url => "contacts")

  end

  def self.down
    drop_table :statics
  end
end
