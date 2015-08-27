class AddTypeItemFromItems < ActiveRecord::Migration
  def change
    add_column :items, :typeItem, :string
  end
end
