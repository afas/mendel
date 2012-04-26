class CreateAlbumImages < ActiveRecord::Migration
  def self.up
    create_table :album_images do |t|
      t.integer :album_id
      t.integer :short_description

      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
    end
    add_index :album_images, :album_id
  end

  def self.down
    drop_table :album_images
  end
end
