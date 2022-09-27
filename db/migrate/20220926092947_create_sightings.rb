class CreateSightings < ActiveRecord::Migration[6.1]
  def change
    create_table :sightings do |t|
      t.belongs_to :region, index: true, foreign_key: true 
      t.belongs_to :animal, index: true, foreign_key: true 
      t.decimal :long
      t.decimal :lat
      t.string :longs
      t.string :lats
      t.date :created_at, precision: 6, null: false
    end
  end
end
