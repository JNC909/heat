class RemoveUserIdFromMembers < ActiveRecord::Migration[7.0]
  def change
    remove_column :members, :user_id, :integer
  end
end
