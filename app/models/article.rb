class Article < ApplicationRecord
    belongs_to :user, optional: true
    mount_uploader :images, ImagesUploader
    has_many :rates
    has_many :likes
    
    def rate_averate
      rates.average(:score).to_i
    end
end
