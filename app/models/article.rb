class Article < ApplicationRecord
    belongs_to :user, optional: true
    validates :title,  presence: true
    validates :description,  presence: true
    validates :price,  presence: true
    validates :language,  presence: true
    validates :period,  presence: true
    validates :country,  presence: true
    mount_uploader :images, ImagesUploader
    has_many :rates
    has_many :likes
    
    def rate_averate
      rates.average(:score).to_i
    end
end
