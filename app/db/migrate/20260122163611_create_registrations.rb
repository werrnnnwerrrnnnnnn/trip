class CreateRegistrations < ActiveRecord::Migration[7.2]
  def change
    create_table :registrations do |t|
      t.string :name
      t.string :man_number
      t.boolean :attending

      t.timestamps
    end
  end
end
