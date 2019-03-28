class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ''
      t.string :mobile
      t.string :email

      t.integer :user_type, default: 0
      t.integer :gender, default: 0
      
      t.string :token
      t.string :password_digest

      t.text :avatar_data
      t.text :wechat_data

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
