class AddEventDateToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :event_date, :datetime
  end

  def self.down
    remove_column :events, :event_date
  end
end
