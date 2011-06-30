class AddOwnerIdToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :owner_id, :integer
  end

  def self.down
    remove_column :events, :owner_id
  end
end
