class AddUserNameAndSaltToAdminUser < ActiveRecord::Migration
  def change
    add_column(:admin_users, :username, :string)
    add_column(:admin_users, :salt, :string)
    rename_column(:admin_users, :password, :hashed_password)
  end
end
