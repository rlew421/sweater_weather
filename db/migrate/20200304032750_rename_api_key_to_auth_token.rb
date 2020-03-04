class RenameApiKeyToAuthToken < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :api_key, :auth_token
  end
end
