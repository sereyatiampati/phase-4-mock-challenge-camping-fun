class ChangeAgeToBeIntegerInCampers < ActiveRecord::Migration[6.1]
  def up
    change_column :campers, :age, :integer
   
  end

  def down
    change_column :campers, :age, :string
  end
end
