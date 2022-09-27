class Region < ApplicationRecord
    has_many :sightings, class_name: 'Sighting', dependent: :destroy 
    has_many :animals, through: :sightings, dependent: :destroy, class_name: 'Animal'

    validates :region, presence: true 
end