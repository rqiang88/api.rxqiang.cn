class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
    	t.belongs_to :user
    	t.belongs_to :category, index: true

    	t.string :title
    	t.string :aasm_state
    	t.text :content

    	t.integer :views_count, default: 0
    	t.integer :comments_count, default: 0

    	t.text :remark
    	t.datetime :deleted_at
      t.timestamps
    end
  end
end
