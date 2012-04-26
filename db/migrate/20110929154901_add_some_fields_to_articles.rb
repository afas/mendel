class AddSomeFieldsToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :start_date, :datetime
    add_column :articles, :stop_date, :datetime
    add_column :articles, :to_index, :boolean
  end

  def self.down
    remove_column :articles, :start_date
    remove_column :articles, :stop_date
    remove_column :articles, :to_index
  end
end
