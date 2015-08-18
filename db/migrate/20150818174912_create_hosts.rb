class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :username
      t.string :emailid
      t.string :passwd
      t.string :confpasswrd
      t.string :name
      t.string :addr
      t.string :lat
      t.string :longi
      t.integer :age
      t.string :phoneno
      t.string :qualification
      t.string :profession
      t.string :languages
      t.string :blog
      t.string :idcard
      t.string :cardtype
      t.string :food
      t.string :destination
      t.string :toddlrReason
      t.string :reasonToenjycooking
      t.string :frequencyofCooking

      t.timestamps null: false
    end
  end
end
