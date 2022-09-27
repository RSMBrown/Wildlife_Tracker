class Animal < ApplicationRecord
    has_many :sightings, class_name: 'Sighting', dependent: :destroy
    has_many :regions, through: :sightings, dependent: :destroy, class_name: 'Region'

    validates :name, presence: true 
end