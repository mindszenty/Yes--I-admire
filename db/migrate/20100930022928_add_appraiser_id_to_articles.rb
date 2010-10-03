class AddAppraiserIdToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :appraiser_id, :integer
  end

  def self.down
    remove_column :articles, :appraiser_id
  end
end
