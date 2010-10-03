class RenameAppraiserIdToUserId < ActiveRecord::Migration
  def self.up
      rename_column :ratings, :appraiser_id, :user_id
  end

  def self.down
      rename_column :ratings, :user_id, :appraiser_id
  end
end
