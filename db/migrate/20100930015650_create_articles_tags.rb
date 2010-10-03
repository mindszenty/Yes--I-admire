class CreateArticlesTags < ActiveRecord::Migration
  def self.up
      create_table :articles_tags, :id => false do |t|
          t.references :article
          t.references :tags
      end
      
      create_table :tags do |t|
          t.string :title

          t.timestamps
      end

  end

  def self.down
      drop_table :articles_tags
      drop_table :tags
  end
end
