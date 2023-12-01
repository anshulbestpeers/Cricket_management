class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :role
      t.jsonb :batting_stats
      t.jsonb :bowling_stats

      t.timestamps
    end
  end
end
