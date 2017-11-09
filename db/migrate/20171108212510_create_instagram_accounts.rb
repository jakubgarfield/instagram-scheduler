class CreateInstagramAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :instagram_accounts do |t|
      t.string :username
      t.string :encrypted_password
      t.string :encrypted_password_iv
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
