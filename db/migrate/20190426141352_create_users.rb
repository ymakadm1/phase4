class CreateUsers < ActiveRecord::Migration[5.2]
  def up
    drop_table :users
    create_table :users do |t|
      t.integer :employee_id
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
