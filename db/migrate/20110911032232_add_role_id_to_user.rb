class AddRoleIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :role_id, :integer, :null => false, :default => 0

    admin = Role.find_by_name('admin')
    User.all.each do |user|
      user.role = admin
      user.save
    end

    admin = User.create(:username => 'admin', :email => 'admin@mendel.su', :password => 'enlightenment')
    admin.role = Role.find_by_name('admin')
    admin.save

  end

  def self.down
    remove_column :users, :role_id
  end
end