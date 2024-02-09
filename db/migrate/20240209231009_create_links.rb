class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :link_id
      t.string :link_name
      t.string :link_description

      t.timestamps
    end
  end
end
