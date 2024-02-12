class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :member_name
      t.integer :member_points
      t.boolean :exec_status
      #t.belongs_to :event, foreign_key: true

      t.timestamps
    end
  end
end

