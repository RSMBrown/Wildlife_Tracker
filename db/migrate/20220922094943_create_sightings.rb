class CreateSightings < ActiveRecord::Migration[6.1]
  def change
    create_table :sightings do |t|
      t.belongs_to :animal, index: true, foreign_key: true 
      t.date :date
      t.decimal :long
      t.decimal :lat
      t.string :longs
      t.string :lats

      t.timestamps
    end
  end
end
