class CreateBarbers < ActiveRecord::Migration[8.0]
  def change
      create_table :barbers do |t|
      t.text :name

      t.timestamps
    end
  
    Barber.create :name => 'Jessie Pinkman'
    Barber.create :name => 'Walter White'
    Barber.create :name => 'Gus Fring'
  end
end
