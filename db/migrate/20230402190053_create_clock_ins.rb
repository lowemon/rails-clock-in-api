class CreateClockIns < ActiveRecord::Migration[6.1]
  def change
    create_table :clock_ins do |t|
      t.datetime :clocked_in_at
      t.datetime :clocked_out_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
