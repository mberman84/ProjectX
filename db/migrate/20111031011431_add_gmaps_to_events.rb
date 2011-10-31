class AddGmapsToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :gmaps, :boolean
  end

  def self.down
    remove_column :events, :gmaps
  end
end
