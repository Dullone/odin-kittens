class CreateKittens < ActiveRecord::Migration
  def change
    create_table :kittens do |t|
      t.string :name
      t.string :age
      t.string :cuteness
      t.string :softness

      t.timestamps null: false
    end
  end
end
