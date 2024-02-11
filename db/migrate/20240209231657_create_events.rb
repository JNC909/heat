class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :event_id
      t.string :event_link
      t.string :event_name
      t.datetime :event_time
      t.integer :event_attendance

      t.timestamps
    end
  end
end
