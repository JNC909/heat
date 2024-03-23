class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.string :name
      t.date :date
      t.time :time  
      t.string :location
      t.text :description  

      t.timestamps
    end
  end
end
