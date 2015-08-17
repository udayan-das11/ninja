class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :name
      t.string :email_id
      t.integer :phone
      t.string :dob
      t.string :card_type
      t.string :card_no
      t.string :marital_status
      t.string :qualification
      t.string :profession
      t.string :favmusic
      t.string :favmovie
      t.string :socialprofile
      t.string :languages
      t.string :favdestination
      t.string :amenities
      t.string :personalitytype
      t.string :descriptionexp
      t.string :descriptionself
      t.string :rating
      t.string :membership

      t.timestamps null: false
    end
  end
end
