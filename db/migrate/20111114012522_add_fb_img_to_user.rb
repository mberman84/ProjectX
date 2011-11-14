class AddFbImgToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :fbimg, :string
  end

  def self.down
    remove_column :users, :fbimg
  end
end
