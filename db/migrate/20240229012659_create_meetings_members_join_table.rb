class CreateMeetingsMembersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings_members, id: false do |t|
      t.references :meeting, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      #t.boolean :attending, default: false

      t.timestamps
    end

    add_index :meetings_members, [:meeting_id, :member_id], unique: true
  end
end

