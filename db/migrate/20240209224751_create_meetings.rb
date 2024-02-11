class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.string :meeting_id
      t.string :meeting_name
      t.datetime :meeting_time
      t.integer :meeting_attendance

      t.timestamps
    end
  end
end
