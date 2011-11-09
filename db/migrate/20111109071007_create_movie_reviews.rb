class CreateMovieReviews < ActiveRecord::Migration
  def self.up
    create_table :movie_reviews do |t|
      t.text :title
      t.text :content
      t.text :image_url
      t.float :rating
      t.boolean :active
      t.string :author

      t.timestamps
    end
  end

  def self.down
    drop_table :movie_reviews
  end
end
