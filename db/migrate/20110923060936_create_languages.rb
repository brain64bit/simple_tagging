class CreateLanguages < ActiveRecord::Migration
  def self.up
    create_table :languages do |t|
      t.string :country_code
      t.string :english_name

      t.timestamps
    end
  end

  def self.down
    drop_table :languages
  end
end
