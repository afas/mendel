class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.text :short_description
      t.integer :album_id
      t.integer :user_id
      t.integer :category_id
      t.text :content

      t.string :preview_file_name
      t.string :preview_content_type
      t.integer :preview_file_size
      t.datetime :preview_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
