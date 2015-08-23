class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :text
      t.string :ambiance
      t.string :social
      t.string :cooking
      t.string :x
      t.string :overall
      t.references :user, index: true, foreign_key: true
      t.references :host, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
