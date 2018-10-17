class AddWinToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :win, :integer
  end
end
