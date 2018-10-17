class CreateWinsloses < ActiveRecord::Migration[5.2]
  def change
    create_table :winsloses do |t|
      t.references :team_id, foreign_key: true
      t.integer :win
      t.integer :loss

      t.timestamps
    end
  end
end
