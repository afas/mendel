class CreateExhibits < ActiveRecord::Migration
  def change
    create_table :exhibits do |t|
      t.string :title
      t.text :description
      t.integer :exhibit_order, :default => 0

      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size

      t.timestamps
    end
  end
end
