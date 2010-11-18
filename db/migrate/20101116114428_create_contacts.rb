class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.integer :user_id

      t.string :name
      t.string :surname
      t.string :email
      t.string :home_url
      t.string :phone
      t.string :city
      t.string :street

      t.timestamps
    end
    add_index :contacts, :user_id
  end

  def self.down
    drop_table :contacts
  end
end
