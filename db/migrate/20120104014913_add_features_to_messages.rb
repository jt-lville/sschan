class AddFeaturesToMessages < ActiveRecord::Migration
  def self.up

    add_column :messages, :unread, :boolean, :default => 1
    add_column :messages, :important, :boolean, :default => 0
    add_column :messages, :group_id, :integer
  end

  def self.down

    remove_column :messages, :unread
    remove_column :messages, :important
    remove_column :messages, :group_id
  end
end
