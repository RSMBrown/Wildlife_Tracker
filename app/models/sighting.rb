class Sighting < ApplicationRecord
    belongs_to :animal, class_name: "Animal", foreign_key: "animal_id"
    validates :date, presence: true 
    validates :long, presence: true 
    validates :longs, presence: true 
    validates :lat, presence: true 
    validates :lats, presence: true 
end
