class CreateMenuAttachments < ActiveRecord::Migration
  def change
    create_table :menu_attachments do |t|
      t.integer :menu_id
      t.string :avatar

      t.timestamps null: false
    end
  end
end
