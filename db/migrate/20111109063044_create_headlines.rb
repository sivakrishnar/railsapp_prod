class CreateHeadlines < ActiveRecord::Migration
  def self.up
    create_table :headlines do |t|
      t.text :title
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :headlines
  end
end
