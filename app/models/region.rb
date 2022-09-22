class Region < ApplicationRecord
    has_many :animals, dependent: :destroy
    validates :region, presence: true 
end
