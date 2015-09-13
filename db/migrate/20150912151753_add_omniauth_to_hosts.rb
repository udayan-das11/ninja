class AddOmniauthToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :uid, :string
  end
end
