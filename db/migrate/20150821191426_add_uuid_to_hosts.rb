class AddUuidToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :uuid, :String
  end
end
