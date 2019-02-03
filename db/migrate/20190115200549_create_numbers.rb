class CreateNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :numbers do |t|
    	t.string :number, null: false
    	t.integer :contact_id
    end
  end
end
