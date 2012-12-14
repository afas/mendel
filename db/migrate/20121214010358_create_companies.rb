class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :description
      t.text :about
      t.string :short_url
      t.integer :company_order

      t.string :logo_file_name
      t.string :logo_content_type
      t.integer :logo_file_size

      t.timestamps
    end
  end
end
