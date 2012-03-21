class Video < ActiveRecord::Base
    validates_uniqueness_of :image_url, :url
end
