class CreateJoinTableMemberEvent < ActiveRecord::Migration[7.0]
  def change
    create_join_table :members, :events do |t|
      # t.index [:member_id, :event_id]
      # t.index [:event_id, :member_id]
    end
  end
end
