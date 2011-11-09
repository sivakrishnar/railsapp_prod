class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.text :title
      t.text :url
      t.text :image_url
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
