class CreateNewsitems < ActiveRecord::Migration
  def self.up
    create_table :newsitems do |t|
      t.text :title
      t.text :content
      t.text :image_url
      t.boolean :active
      t.string :author

      t.timestamps
    end
  end

  def self.down
    drop_table :newsitems
  end
end
