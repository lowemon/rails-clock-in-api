class CreateSleepRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :sleep_records do |t|
      t.references :user, foreign_key: true
      t.float :length
      
      t.timestamps
    end
  end
end
