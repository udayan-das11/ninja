class CreateImageGallaries < ActiveRecord::Migration
  def change
    create_table :image_gallaries do |t|
      t.string :image_id
      t.references :Host, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
