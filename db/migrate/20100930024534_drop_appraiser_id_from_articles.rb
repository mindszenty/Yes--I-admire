class DropAppraiserIdFromArticles < ActiveRecord::Migration
  def self.up
    remove_column :articles, :appraiser_id
  end

  def self.down
    add_column :articles, :appraiser_id, :integer
  end
end
