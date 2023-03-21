class CreateSignups < ActiveRecord::Migration[6.1]
  def change
    create_table :signups do |t|
      t.integer :time
      t.references :activity
      t.references :camper

      t.timestamps
    end
  end
end
