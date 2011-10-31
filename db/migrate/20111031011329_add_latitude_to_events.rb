class AddLatitudeToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :latitude, :float
  end

  def self.down
    remove_column :events, :latitude
  end
end
