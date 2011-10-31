class AddLongitudeToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :longitude, :float
  end

  def self.down
    remove_column :events, :longitude
  end
end
