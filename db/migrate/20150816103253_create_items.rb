class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :desc
      t.string :type
      t.string :tastetype
      t.references :Menu, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
