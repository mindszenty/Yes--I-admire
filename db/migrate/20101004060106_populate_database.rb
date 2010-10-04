class PopulateDatabase < ActiveRecord::Migration
  def self.up
      User.create(:email=>"anonymous@internet.org", :passhash=>"mD0g2de71")
      Category.create(:title=>"General")
      Category.create(:title=>"Official")
      Category.create(:title=>"Social")
  end

  def self.down
      User.find_by_email("anonymous@internet.org").destroy
      Category.find_by_title("General").destroy
      Category.find_by_title("Official").destroy
      Category.find_by_title("Social").destroy
  end
end
