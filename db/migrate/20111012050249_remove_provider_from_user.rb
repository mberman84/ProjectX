class RemoveProviderFromUser < ActiveRecord::Migration
  def self.up
    remove_column :users, :provider
  end

  def self.down
    add_column :users, :provider, :string
  end
end
