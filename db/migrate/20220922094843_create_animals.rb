class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.belongs_to :region, index: true, foreign_key: true 
      t.string :name

      t.timestamps
    end
  end
end
