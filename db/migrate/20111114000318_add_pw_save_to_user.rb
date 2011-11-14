class AddPwSaveToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :pwsave, :bool
  end

  def self.down
    remove_column :users, :pwsave
  end
end
