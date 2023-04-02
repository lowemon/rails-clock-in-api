class CreateClockIns < ActiveRecord::Migration[6.1]
  def change
    create_table :clock_ins do |t|

      t.timestamps
    end
  end
end
