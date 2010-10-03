class RenameTagsIdToTagId < ActiveRecord::Migration
  def self.up
      rename_column :articles_tags, :tags_id, :tag_id
  end

  def self.down
      rename_column :articles_tags, :tag_id, :tags_id
  end
end
