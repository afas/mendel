class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.string :title
      t.text :short_description
      t.boolean :to_index
      t.integer :category_id
      t.integer :article_id
      t.integer :user_id

      t.string :preview_file_name
      t.string :preview_content_type
      t.integer :preview_file_size
      t.datetime :preview_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
