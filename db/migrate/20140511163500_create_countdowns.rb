class CreateCountdowns < ActiveRecord::Migration
  def change
    create_table :countdowns do |t|
      t.string :name
      t.string :description
      t.string :link
      t.datetime :countdown_date

      t.timestamps
    end
  end
end
