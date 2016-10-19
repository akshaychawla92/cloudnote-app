class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.string :card_number
      t.string :expiry_date
      t.string :security_code
      t.string :bank_name

      t.timestamps null: false
    end
  end
end
