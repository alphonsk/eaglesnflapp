class CreateUserteams < ActiveRecord::Migration[5.2]
  def change
    create_table :userteams do |t|
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
