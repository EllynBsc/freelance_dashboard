class CreateMissions < ActiveRecord::Migration[5.2]
  def change
    create_table :missions do |t|
      t.string :company
      t.string :location
      t.string :favorite
      t.datetime :start_date
      t.datetime :end_date
      t.string :status, default: 'pending'
      t.string :title
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
