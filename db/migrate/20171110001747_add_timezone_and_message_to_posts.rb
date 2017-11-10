class AddTimezoneAndMessageToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :timezone, :string
    add_column :posts, :message, :string
  end
end
