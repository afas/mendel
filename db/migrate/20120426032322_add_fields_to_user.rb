class AddFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    add_column :users, :secondname, :string
    add_column :users, :surname, :string
    add_column :users, :faculty, :integer
    add_column :users, :kafedra, :integer
    add_column :users, :course, :integer
    add_column :users, :about, :text
    add_column :users, :avatar_file_name, :string
    add_column :users, :avatar_content_type, :string
    add_column :users, :avatar_file_size, :string
    add_column :users, :avatar_updated_at, :datetime
  end

  def self.down
    remove_column :users, :name
    remove_column :users, :secondname
    remove_column :users, :surname
    remove_column :users, :faculty
    remove_column :users, :kafedra
    remove_column :users, :course
    remove_column :users, :about
    remove_column :avatar_file_name
    remove_column :avatar_content_type
    remove_column :avatar_file_size
    remove_column :users, :avatar_updated_at
  end
end
