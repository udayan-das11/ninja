class AddProviderToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :provider, :String
  end
end
