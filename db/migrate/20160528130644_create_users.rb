class CreateUsers < ActiveRecord::Migration[5.0]

  def change
    create_table :users do |t|
      t.string :name
      t.string :phone_number
      t.string :description
      t.date :birth_date

      t.timestamps
    end
  end

end
