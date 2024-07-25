class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email ,unique: true
      t.string :password_digest
      t.string :phone
      t.date :dob
      t.string :gender
      t.string :address
      t.timestamps
    end
  end
end
