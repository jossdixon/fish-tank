class CreateAquatics < ActiveRecord::Migration[6.0]
  def change
    create_table :aquatics do |t|
      t.string :nick_name
      t.string :common_name
      t.string :scientific_name
      t.integer :length
      t.integer :max_lifespan
      t.date :purchased_on
      t.references :user, null: false, foreign_key: true
      t.string :notes

      t.timestamps
    end
  end
end
