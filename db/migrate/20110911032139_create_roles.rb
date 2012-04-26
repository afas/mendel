class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name, :null => false, :default => ''

      t.timestamps
    end

    add_index :roles, :name, :unique => true

    Role.create(:name => 'admin')
    Role.create(:name => 'member')
  end

  def self.down
    drop_table :roles
  end
end
