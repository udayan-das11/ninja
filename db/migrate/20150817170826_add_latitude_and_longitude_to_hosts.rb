class AddLatitudeAndLongitudeToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :latitude, :string
    add_column :hosts, :logitude, :string
  end
end
