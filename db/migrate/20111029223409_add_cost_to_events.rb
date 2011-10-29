class AddCostToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :cost, :float
  end

  def self.down
    remove_column :events, :cost
  end
end
