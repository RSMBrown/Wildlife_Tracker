class Animal < ApplicationRecord
    belongs_to :region, class_name: "Region", foreign_key: "region_id"
    has_many :sightings, dependent: :destroy
    validates :name, presence: true 
end
