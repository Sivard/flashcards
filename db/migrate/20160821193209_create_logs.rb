class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :user
      t.integer :status
      t.text :msg

      t.timestamps null: false
    end
  end
end
