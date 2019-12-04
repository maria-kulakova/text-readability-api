class ChangeUsers < ActiveRecord::Migration[6.0]
  change_column :users, :admin, :boolean, default: false
  change_column_null :users, :email, false
  change_column_null :users, :password_digest, false
end
