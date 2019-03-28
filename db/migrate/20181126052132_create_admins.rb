class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :name, null: false, default: ''
      t.string :mobile
      t.string :email

      t.string :token
      t.string :password_digest

      t.text :avatar_data

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
