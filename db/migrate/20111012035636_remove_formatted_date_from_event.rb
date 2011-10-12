class RemoveFormattedDateFromEvent < ActiveRecord::Migration
  def self.up
    remove_column :events, :formatted_Date
  end

  def self.down
    add_column :events, :formatted_Date, :string
  end
end
