class AddLossToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :loss, :integer
  end
end
