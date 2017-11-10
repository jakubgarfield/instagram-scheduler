class MoveTimezoneFromPostsToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :timezone
    add_column :users, :timezone, :string
  end
end
