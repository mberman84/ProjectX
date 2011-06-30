class CreateEventsUsersJoin < ActiveRecord::Migration
  def self.up
    create_table 'events_users', :id => false do |t|
      t.column 'event_id', :integer
      t.column 'user_id', :integer
    end
  end

  def self.down
    drop_table 'events_users'
  end
end
