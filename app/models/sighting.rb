class Sighting < ApplicationRecord
    belongs_to :animal, class_name: "Animal", foreign_key: "animal_id"
    belongs_to :region, class_name: "Region", foreign_key: "region_id"
    
    validates :long, presence: true 
    validates :longs, presence: true 
    validates :lat, presence: true 
    validates :lats, presence: true 
end