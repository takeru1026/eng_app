class Article < ApplicationRecord
    belongs_to :user, optional: true
    mount_uploader :image, ImagesUploader
    has_many :rates
  
    def rate_averate
      rates.average(:score).to_i
    end
end
