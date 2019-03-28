class CreateAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :attachments do |t|
      t.references :admin, index: true
      t.references :source, polymorphic: true, index: true
      t.json :att
      t.json :info
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
