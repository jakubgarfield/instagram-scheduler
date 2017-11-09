class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :filepath
      t.datetime :scheduled_at
      t.datetime :published_at
      t.belongs_to :instagram_account, foreign_key: true

      t.timestamps
    end
  end
end
