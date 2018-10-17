class AddAbrNameToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :abr_name, :string
  end
end
