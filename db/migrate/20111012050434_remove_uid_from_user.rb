class RemoveUidFromUser < ActiveRecord::Migration
  def self.up
    remove_column :users, :uid
  end

  def self.down
    add_column :users, :uid, :string
  end
end
