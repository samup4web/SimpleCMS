class CreateAdminUsersPages < ActiveRecord::Migration
  def change
    create_table "admin_users_pages", :id => false, :force => true do |t|
      t.integer "admin_user_id"
      t.integer "page_id"
    end
    add_index "admin_users_pages", ["admin_user_id", "page_id"], :name => "index_admin_users_pages_on_admin_user_id_and_page_id"
    add_index  "admin_users", ["username"], :name => "index_admin_users_on_username"
  end
end
