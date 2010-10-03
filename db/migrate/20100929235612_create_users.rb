class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :passhash
      t.string :fullname

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end