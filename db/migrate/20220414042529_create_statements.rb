class CreateStatements < ActiveRecord::Migration[6.1]
  def change
    create_table :statements do |t|
      t.datetime :start_date
      t.datetime :finish_date
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
