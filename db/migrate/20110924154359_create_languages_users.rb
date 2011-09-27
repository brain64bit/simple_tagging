class CreateLanguagesUsers < ActiveRecord::Migration
  def self.up
  	 create_table :languages_users, :id => false do |t|
      t.references :user
      t.references :language
    end
  end

  def self.down
  	drop_table :languages_users
  end
end
