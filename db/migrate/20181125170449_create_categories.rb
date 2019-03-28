class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
    	t.references :user, index: true
    	t.string :name,  null: false, default: ''
    	t.datetime :deleted_at
      t.timestamps
    end
  end
end
