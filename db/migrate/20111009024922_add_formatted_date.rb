class AddFormattedDate < ActiveRecord::Migration
  def self.up
    add_column :events, :formatted_Date, :text
  end

  def self.down
    remove_column :events, :formatted_Date
  end
end
