class CreateProfilePhotos < ActiveRecord::Migration
  def change
    create_table :profile_photos do |t|
      t.integer :host_id
      t.string :avatar

      t.timestamps null: false
    end
  end
end
